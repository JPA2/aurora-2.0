<?php
namespace Store\Model;
use Store\Db\TableGateway\OrdersTable;
use Store\Db\TableGateway\ProductsTable;
use Store\Db\RowGateway\Order;
use User\Model\User;
use function func_get_args;
use function is_array;
class Cart
{
    /**
     * @var \User\Model\User $user;
     */
    protected $user;
    /**
     * @var \Store\Db\RowGateway\Order $order
     */
    protected $order;
    /**
     * @var int $itemCount
     */
    protected $itemCount;
    /**
     * Array of Product instances
     * @var [] $items
     */
    protected $items = [];
    /**
     * @var \Store\Db\TableGateway\OrdersTable $orderTable
     */
    protected $ordersTable;
    /**
     * @var \Store\Db\TableGateway\ProductsTable $productTable
     */
    protected $productsTable;
    public function __construct(ProductsTable $productTable, OrdersTable $ordersTable)
    {
        $this->productTable = $productTable;
        $this->ordersTable = $ordersTable;
    }
    public function setOrderTable(OrdersTable $orderTable)
    {
        $this->orderTable = $this->orderTable;
    }
    public function setProductTable(ProductsTable $productTable)
    {
        $this->productTable = $productTable;
    }
    public function setUser(User $user)
    {
        $this->user = $user;
    }
}