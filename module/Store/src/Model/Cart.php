<?php
namespace Store\Model;
use Laminas\Stdlib\ArrayObject;
use Interop\Container\ContainerInterface;
use Laminas\Authentication\AuthenticationService;
use Laminas\Permissions\Acl\Acl;
use Laminas\Authentication\AuthenticationServiceInterface;
use Laminas\Session\Container as SessionContainer;
use Laminas\Session\SessionManager;
use Laminas\View\Model\ModelInterface as ModelModelInterface;
use Psr\Container\NotFoundExceptionInterface;
use Psr\Container\ContainerExceptionInterface;
use Store\Model\Order;
use Store\Model\Product;
use User\Model\Guest;
use User\Model\User;
use User\Model\UserTable;
use function func_get_args;
use function is_array;

class Cart extends ArrayObject
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
     * @var \Store\Model\Order $order
     */
    protected $order;
    /**
     * @var \Store\Model\Product $product
     */
    protected $product;
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
     * @var \User\Model\UserTable $userTable
     */
    protected $userTable;
    protected $data = [];
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
        $this->product = $container->get(Product::class);
        $this->order = $container->get(Order::class);
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
        parent::__construct([], ArrayObject::ARRAY_AS_PROPS);
    }
    public function setUser(User $user)
    {
        $this->user = $user;
    }
}