<?php
namespace Store\Model;
use Interop\Container\ContainerInterface;
use Laminas\Authentication\AuthenticationService;
use Laminas\Permissions\Acl\Acl;
use Laminas\Authentication\AuthenticationServiceInterface;
use Laminas\Session\Container as SessionContainer;
use Laminas\Session\SessionManager;
use Psr\Container\NotFoundExceptionInterface;
use Psr\Container\ContainerExceptionInterface;
use Store\Db\TableGateway\OrdersTable;
use Store\Db\TableGateway\ProductsTable;
use Store\Db\RowGateway\Order;
use User\Model\Guest;
use User\Model\User;
use User\Model\UserTable;
use function func_get_args;
use function is_array;
class Cart
{
    /**
     * @var \Laminas\Session\Container $sessionContainer
     */
    private $sessionContainer;
    /**
     * @var \Laminas\Session\SessionManager $sessionManager
     */
    private $sessionManager;
    /**
     * @var \Laminas\Permissions\Acl\Acl $acl
     */
    protected $acl;
    /**
     * @var \Laminas\Authentication\AuthenticationService $auth
     */
    protected $auth;
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
    /**
     * @var \User\Model\UserTable $userTable
     */
    protected $userTable;
    /**
     * 
     * @param ContainerInterface $container 
     * @return void 
     * @throws NotFoundExceptionInterface 
     * @throws ContainerExceptionInterface 
     */
    public function __construct(ContainerInterface $container)
    {
        $this->acl = $container->get('Acl');
        $this->auth = $container->get(AuthenticationService::class);
        $this->productsTable = $container->get(ProductsTable::class);
        $this->ordersTable = $container->get(OrdersTable::class);
        $this->userTable = $container->get(UserTable::class);
        $this->sessionContainer = new SessionContainer('Cart');
        if($this->auth->hasIdentity())
        {
            $identity = $this->auth->getIdentity();
            $this->user = $this->userTable->fetchByColumn('userName', $identity);
        }
        else {
            $this->user = new Guest();
        }
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