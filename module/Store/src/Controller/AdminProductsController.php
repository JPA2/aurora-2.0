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
     * 
     * @param \Laminas\Permissions\Acl\Acl $acl 
     * @param \Store\Db\TableGateway\CategoriesTable $categoriesTable 
     * @param \Store\Db\TableGateway\ProductsTable $productsTable
     * @param \Store\Form\ProductForm $form
     * @return void 
     */
    public function __construct(
        Acl $acl, 
        CategoriesTable $categoriesTable,
        ProductsTable $productsTable,
        ProductForm $form
        )
    {
        $this->acl = $acl;
        $this->categoriesTable = $categoriesTable;
        $this->productsTable = $productsTable;
        $this->form = $form;
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
    public function manageAction()
    {
        $sessionContainer = new Container();
        if($this->request->isXmlHttpRequest()) {
            $this->view->setTerminal(true);
        }
        $step = $this->params('step', 'create');
        $data = [];
        $config['upload-config']['module'] = 'store';
        $config['upload-config']['type'] = 'products';
        $data['product-info']['userId'] = $this->user->id;

        $product = $this->sm->get(Product::class);
        $id = $this->params('id', null);
        
        switch($step)
        {
            case 'create':
                if($this->request->isPost())
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
                        $data = $this->form->getData();
                        try {
                            $product->exchangeArray($data['product-info']);
                            $product->save($product);
                            $this->form->remove('product-info');
                            $imageFieldset = $this->sm->get(UploaderAwareMultiFile::class);
                            $imageFieldset->init();
                            $this->form->add( $imageFieldset );
                            
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
                else {
                    /**
                     * Yes, this is hackish, but for the moment we need to create a new empty row
                     * to work with so that we have a productId to associate these records with if 
                     * file upload happens during creation, which is usually will.....
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
                            'manage.product',
                            ['action' => 'edit', 'id' => $product->id]
                        )
                    );
                    $this->form->setData(array_merge_recursive($config,$data));
                }
                break;
            case 'edit':
                $product = $product->fetchByColumn('id', $id);
                if(!$this->request->isPost()) 
                {
                    $this->form->setAttribute(
                        'action', 
                        $this->url()->fromRoute(
                            'manage.product', 
                            ['step' => 'edit', 'id' => $id]
                        )
                    );
                    $this->form->setData([
                        'upload-config' => $data['upload-config'],
                        'product-info' => $product->toArray()
                    ]);
                }
            case 'upload-files':
                    $postedData = $this->request->getPost();

                    $this->form->setData();
                }
                break;
            case 'delete':
                // delete the product by id
                break;
        }
        $this->form->setAttribute('action', $this->url()->fromRoute('admin.store/manage.product', ['step' => $step]));
        $this->view->setVariable('form', $this->form);
        return $this->view;
    }
}
