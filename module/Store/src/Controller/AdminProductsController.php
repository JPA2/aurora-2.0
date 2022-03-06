<?php
namespace Store\Controller;
use Application\Controller\AbstractAdminController;
use Laminas\Permissions\Acl\Acl;
use PhpParser\Node\Stmt\TryCatch;
use Store\Db\TableGateway\CategoriesTable;
use Store\Db\TableGateway\ProductsByCategoryTable;
use Store\Db\TableGateway\ProductsTable;
use Store\Model\Product;
use Store\Form\ProductForm;
use Store\Form\Fieldset\ProductImages;

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
        if($this->request->isXmlHttpRequest()) {
            $this->view->setTerminal(true);
        }
        $step = $this->params('step', 'create');
        $data = [];
        $product = $this->sm->get(Product::class);
        $id = $this->params('id', null);
        
        switch($step)
        {
            case 'create':
                if($this->request->isPost())
                {
                    $data = $this->request->getPost();
                    $this->form->setData($data->toArray());
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
                            $imageFieldset = $this->sm->get(ProductImages::class);
                            $this->form->add($imageFieldset->init());
                        } catch (\Throwable $th) {
                            $this->logger->log(6, $th->getMessage());
                        }
                        $step = 'upload-files';
                    }
                    else {
                        $this->view->setVariable('form', $this->form);
                        return $this->view;
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
                    $data['upload-config']['module'] = 'store';
                    $data['upload-config']['type'] = 'products';
                    $data['product-info']['id'] = $product->id;
                    $data['product-info']['userId'] = $this->user->id;
                    $this->form->setData($data);
                }
                
                break;
            case 'edit':
                $product = $product->fetchByColumn('id', $id);
                if(!$this->request->isPost()) 
                {
                    $this->form->setData(['product-info' => $product->toArray()]);
                }
            case 'upload-files':
                // this is next step, create the image upload fieldset
                // add progress bars, try multiple upload
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
