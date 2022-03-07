<?php

namespace User\Model;

use RuntimeException;
use Laminas\Session;
use User\Model\User as User;
use User\Model\Profile as Profile;
use Laminas\Db\TableGateway\TableGateway;
use Laminas\Authentication\Adapter\DbTable\CallbackCheckAdapter as AuthAdapter;
use Laminas\Authentication\AuthenticationService as AuthService;
use Laminas\Authentication\Result;
use Laminas\Db\Sql\Select as Select;
use Laminas\Db\Sql\Where;
use Laminas\Db\Metadata\Metadata;
use Laminas\Db\RowGateway\RowGatewayInterface;
use Application\Db\TableGateway\TableGatewayTrait;

class UserTable extends TableGateway
{
    use TableGatewayTrait;
    public $pk = 'id';
    public function login(RowGatewayInterface $user)
    {
        try {
            $callback = function ($hash, $password) {
                return password_verify($password, $hash);
            };

            $authAdapter = new AuthAdapter(
                $this->getAdapter(),
                'user',
                'userName',
                'password',
                $callback
            );

            $authAdapter->setIdentity($user->userName)
                ->setCredential($user->password);

            $select = $authAdapter->getDbSelect();
            $select->where('active = 1')->where('verified = 1');

            // Perform the authentication query, saving the result
            $authService = new AuthService();
            $authService->setAdapter($authAdapter);
            $result = $authService->authenticate();
            /**
             * Handle the authentication query result
             */
            //var_dump($result->getMessages());
            // die(__FILE__);
            switch ($result->getCode()) {

                case Result::SUCCESS:
                    //$this->logger->info('User ' . $result->userName . ' logged in.', ['userId' => $result->id, 'userName' => $result->userName]);
                    /** do stuff for successful authentication **/
                    $omitColumns = ['password'];
                    $user = $authAdapter->getResultRowObject(null, $omitColumns);

                    return $this->fetchByColumn('userName', $result->getIdentity());
                    break;

                case Result::FAILURE_IDENTITY_NOT_FOUND:
                    /** do stuff for nonexistent identity **/
                    return $result;
                    break;

                case Result::FAILURE_CREDENTIAL_INVALID:
                    /** do stuff for invalid credential **/
                    return $result;
                    break;

                default:
                    /** do stuff for other failure **/
                    return false;
                    break;
            }
        } catch (RuntimeException $e) {
        }
    }
    public function fetchUserContext($userName)
    {
        $userName = (string) $userName;
        $rowset = $this->select(function (Select $select) use ($userName) {
            $select->where(['user.userName' => $userName])
                ->columns(
                    [
                        'id',
                        'userName',
                        'email',
                        'role',
                        'sessionLength',
                        'companyName',
                        'regDate',
                        'active',
                        'verified',
                    ]
                )
                ->join(
                    'user_profile',
                    'user.id = user_profile.userId',
                    [
                        'firstName',
                        'lastName',
                        'profileImage',
                        'age',
                        'birthday',
                        'gender',
                        'race',
                        'bio',
                    ]
                )
                ->join('user_roles', 'user.role = user_roles.role', ['label']);
        });
        $row = $rowset->current();
        //var_dump($row);
        //$this->logger->info("__FILE__ __LINE__", );
        //unset($row->password);
        try {
            if (!$row) {
                throw new RuntimeException(sprintf(
                    'Could not find row with identifier %d',
                    $userName
                ));
            }
        } catch (\Throwable $th) {
            $row = $this->fetchByColumn('userName', $userName);
        }
        return $row;
    }
    public function loadMemberContext()
    {
        $select = new Select();
        $select
        ->from('user_roles')
        ->join(
            'user',
            'user.role = user_roles.role'
            )
        ->join(
            'user_profile',
            'user_profile.userId = user.id'
        )
        ->order(['user_roles.label ASC', 'user.regDate DSC']);
        return $this->executeSelect($select);
    }
    public function getHashByEmail($email)
    {
        $rowset = $this->select(['email' => $email]);
        $row = $rowset->current();
        if (!$row) {
            throw new RuntimeException(sprintf(
                'Could not find row with identifier %d',
                $email
            ));
        }
        return $row->password;
    }

    public function getCurrentUser($email)
    {
        $email = (string) $email;
        $rowset = $this->select(function (Select $select) use ($email) {
            $select->where(['user.email' => $email])->join(
                'user_profile',              // table name
                'user.id = user_profile.userId'
            );
        });
        $row = $rowset->current();
        //var_dump($row);
        //$this->logger->info("__FILE__ __LINE__", );
        //unset($row->password);
        if (!$row) {
            throw new RuntimeException(sprintf(
                'Could not find row with identifier %d',
                $email
            ));
        }

        return $row;
    }
    public function getUserByEmail($email, $asArray = false)
    {
        $email = (string) $email;
        $rowset = $this->select(['email' => $email]);
        $row = $rowset->current();
        //unset($row->password);
        if (!$row) {
            throw new RuntimeException(sprintf(
                'Could not find row with identifier %d',
                $email
            ));
        }

        return $row;
    }
    public function fetchUserById($id)
    {
        $id = (int) $id;
        $rowset = $this->select(['id' => $id]);
        $row = $rowset->current();
        if (!$row) {
            throw new RuntimeException(sprintf(
                'Could not find row with identifier %d',
                $id
            ));
        }
        $row->password = null;
        return $row;
    }
    public function getUser($id)
    {
        $id = (int) $id;
        $rowset = $this->select(['id' => $id]);
        $row = $rowset->current();
        if (!$row) {
            throw new RuntimeException(sprintf(
                'Could not find row with identifier %d',
                $id
            ));
        }

        return $row;
    }

    public function deleteUser($id)
    {
        $this->delete(['id' => (int) $id]);
    }
}
