<?php
namespace Store\Controller;
use Application\Controller\AbstractAdminController;
use Store\Db\RowGateway\Product;
use Store\Form\ProductForm;

class AdminProductsController extends AbstractAdminController
{
    public function indexAction()
    {
    }
    public function manageSettings()
    {

    }
    public function createProductAction()
    {
        $ptbl = $this->sm->get(\Store\Db\TableGateway\ProductsTable::class);
        $columns = ['id', 'userId', 'name', 'cost'];
        $columnName = 'manufacturer';
        $value = 'Prada';
        $product = $ptbl->fetchColumnsByColumn($columnName, $value, $columns);
        $step = $this->params('step', 'product-data');
        $area = $this->params('area', 'main');
        switch($step)
        {
            case 'product-data':
                $form = new ProductForm('create_product', []);
                if($this->request->isPost())
                {
                    $data = $this->request->getPost();
                    $form->setData($data);
                }
                break;
            case 'upload-files':
                
                break;
        }
        $this->view->setVariable('form', $form);
        return $this->view;
    }
}
