<?php
declare(strict_types=1);
namespace Store\Controller;

use Application\Controller\AbstractAdminController;
use Laminas\Permissions\Acl\Acl;
use Store\Db\TableGateway\CategoriesTable;
use Laminas\Session\Container;
use Store\Db\TableGateway\ProductsByCategoryTable;
use Store\Db\TableGateway\ProductsTable;
use Store\Model\Product;
use Store\Form\ProductForm;
use Uploader\Fieldset\UploaderAwareMultiFile;

class AdminProductsController extends AbstractAdminController
{
    /**
     * @var \Laminas\Permissions\Acl\Acl $acl
     */
    public $acl;
    /**
     * @var \Store\Db\TableGateway\CategoriesTable $categoriesTable
     */
    protected $categoriesTable;
    /**
     * @var \Store\Db\TableGateway\ProductsTable $productsTable
     */
    protected $productsTable;
    /**
     * @var \Store\Form\ProductForm $form
     */
    protected $form;
    /**
     * @var Store\Model\Product $product
     */
    protected $product;
    protected $uploadConfig = [];
    /**
     * 
     * @param \Laminas\Permissions\Acl\Acl $acl 
     * @param \Store\Db\TableGateway\CategoriesTable $categoriesTable 
     * @param \Store\Db\TableGateway\ProductsTable $productsTable
     * @param \Store\Model\Product $product
     * @param \Store\Form\ProductForm $form
     * @return void 
     */
    public function __construct(
        Acl $acl, 
        CategoriesTable $categoriesTable,
        ProductsTable $productsTable,
        Product $product,
        ProductForm $form
        )
    {
        $this->acl = $acl;
        $this->categoriesTable = $categoriesTable;
        $this->productsTable = $productsTable;
        $this->product = $product;
        $this->form = $form;
        $this->uploadConfig['upload-config']['module'] = 'store';
        $this->uploadConfig['upload-config']['type'] = 'products';
    }
    public function _init()
    {
        parent::_init();
    }
    public function indexAction()
    {
        if($this->request->isXmlHttpRequest()) {
            $this->view->setTerminal(true);
        }
        return $this->view;
    }
    public function manageSettings()
    {

    }
    public function managerAction()
    {   
        // Refactor this into individual action since were using ajax
        // This action is just the central endpoint for marshalling all subactions
        $sessionContainer = new Container();
        if($this->request->isXmlHttpRequest()) {
            $this->view->setTerminal(true);
        }
        $data = [];

        $data['product-info']['userId'] = $this->user->id;

        $product = $this->sm->get(Product::class);
        $id = $this->params('id', null);
        /**
         * Even though we will not be creating the product here, we need to 
         * setup the form and populate it with its default values
         * along with setting the correct action attribute so that it 
         * will post to the correct action when submitted
         */
        $product->id = $id;
        $product->name = '';
        $product->userId = $this->user->id;
        $product->categoryId = null;
        $product = $product->save($product);
        $sessionContainer->product = $product->toArray();
        
        $data['product-info']['id'] = $product->id;
        
        $this->form->setAttribute(
            'action',
            $this->url()->fromRoute(
                'admin.store/products/manager',
                ['action' => 'edit', 'id' => $product->id]
            )
        );
        $this->form->setData(array_merge_recursive($this->uploadConfig,$data));
        $this->view->setVariable('form', $this->form);
        return $this->view;
    }
    public function createAction()
    {
        $postData = $this->request->getPost();
        $this->form->setData($postData->toArray());
        /**
         * @var \Application\Form\Fieldset\FieldsetTrait $fieldset
         */
        $fieldset = $this->form->get('product-info');
        $validationGroup = $fieldset->getElementNames();
        $this->form->setValidationGroup(['product-info' => $validationGroup]);
        if($this->form->isValid())
        {
            // get the data from the form
            $data = $this->form->getData();
            try {
                $this->product->exchangeArray($data['product-info']);
                $this->product->save($this->product);
                $this->form->remove('product-info');
                $imageFieldset = $this->sm->get(UploaderAwareMultiFile::class);
                $imageFieldset->init();
                $this->form->add( $imageFieldset );
                $this->form->setData($data['upload-config']);
            } catch (\Throwable $th) {
                $this->logger->log(6, $th->getMessage());
            }
            $step = 'upload-files';
        }
        else {
            $this->view->setVariable('form', $this->form);
            //return $this->view;
        }
    }
    public function editAction()
    {
        $id = $this->params('id');
        $this->product = $this->product->fetchByColumn('id', $id);
        if($this->request->isXmlHttpRequest()) {
            $this->view->setTerminal(true);
        }
        if(!$this->request->isPost()) 
        {
            $this->form->setAttribute(
                'action',
                $this->url()->fromRoute(
                    'admin.store/product/manager', 
                    ['action' => 'edit', 'id' => $id]
                )
            );
            $this->form->setData([
                'upload-config' => $data['upload-config'],
                'product-info' => $product->toArray()
            ]);
        }
        return $this->view;
    }
    public function uploadImagesAction()
    {

    }
    public function deleteAction()
    {

    }
}
