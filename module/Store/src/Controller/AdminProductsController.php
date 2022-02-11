<?php
namespace Store\Controller;
use Application\Controller\AbstractAdminController;
use Laminas\Permissions\Acl\Acl;
use PhpParser\Node\Stmt\TryCatch;
use Store\Db\TableGateway\CategoriesTable;
use Store\Db\TableGateway\ProductsTable;
use Store\Model\Product;
use Store\Form\ProductForm;

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
    public function indexAction()
    {
        $product = $this->productsTable->fetchByColumn('id', null);
        $exit = '';
    }
    public function manageSettings()
    {

    }
    public function createProductAction()
    {   
        $step = $this->params('step', 'product-data');
        $area = $this->params('area', 'main');
        $data = [];
        $product = $this->sm->get(Product::class);
        //$product = $this->productsTable->fetchByColumn('id', 2);
        switch($step)
        {
            case 'product-info':
                if($this->request->isPost())
                {
                    $data = $this->request->getPost();
                    $this->form->setData($data->toArray());
                    $validationGroup = $this->form->get('product-info')->getElementNames(['id','category']);
                    $this->form->setValidationGroup(['product-info' => $validationGroup]);
                    if($this->form->isValid())
                    {
                        $data = $this->form->getData();
                        try {
                            $result = $product->insert($data['product-info']);
                        } catch (\Throwable $th) {
                            $this->logger->log(6, $th->getMessage());
                        }
                    }
                }
                else {
                    $data['product-info']['userId'] = $this->user->id;
                    $this->form->setData($data);
                }
                break;
            case 'upload-files':

                break;
        }
        $this->view->setVariable('form', $this->form);
        return $this->view;
    }
}
