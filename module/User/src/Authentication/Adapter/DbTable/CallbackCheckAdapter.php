<?php
declare(strict_types=1);
namespace user\Authentication\Adapter\DbTable;

use User\Model\Users as User;
use Laminas\Authentication\Adapter\DbTable\CallbackCheckAdapter as CallbackCheck;
use Laminas\Authentication\Result as AuthenticationResult;
use Laminas\Db\Adapter\Adapter;
use Laminas\Stdlib\ArrayObject;
use \stdClass;
class CallbackCheckAdapter extends CallbackCheck
{
    public function __construct(
    User $usrModel, 
    Adapter $dbAdapter, 
    $tableName = null,
    $identityColumn = null,
    $credentialColumn = null,
    $credentialValidationCallback = null
    )
    {
        $this->usrModel = $usrModel;
        parent::__construct(
            $dbAdapter,
            $tableName,
            $identityColumn,
            $credentialColumn,
            $credentialValidationCallback
        );
    }
        /**
     * _authenticateValidateResult() - This method attempts to validate that
     * the record in the resultset is indeed a record that matched the
     * identity provided to this adapter.
     *
     * @param  array $resultIdentity
     * @return AuthenticationResult
     */
    protected function authenticateValidateResult($resultIdentity)
    {
        try {
            $callbackResult = call_user_func(
                $this->credentialValidationCallback,
                $resultIdentity[$this->credentialColumn],
                $this->credential
            );
        } catch (\Exception $e) {
            $this->authenticateResultInfo['code']       = AuthenticationResult::FAILURE_UNCATEGORIZED;
            $this->authenticateResultInfo['messages'][] = $e->getMessage();
            return $this->authenticateCreateAuthResult();
        }
        if ($callbackResult !== true) {
            $this->authenticateResultInfo['code']       = AuthenticationResult::FAILURE_CREDENTIAL_INVALID;
            $this->authenticateResultInfo['messages'][] = 'Supplied credential is invalid.';
            return $this->authenticateCreateAuthResult();
        }

        $this->resultRow = $resultIdentity;
        //$this->authenticateResultInfo['identity']  = $resultIdentity;
        $this->authenticateResultInfo['identity']  = new ArrayObject(($this->getResultRowObject())->getArrayCopy(), ArrayObject::ARRAY_AS_PROPS);
        $this->authenticateResultInfo['code']       = AuthenticationResult::SUCCESS;
        $this->authenticateResultInfo['messages'][] = 'Authentication successful.';
        return $this->authenticateCreateAuthResult();
    }
    /**
     * getResultRowObject() - Returns the result row as a stdClass object
     *
     * @param  string|array $returnColumns
     * @param  string|array $omitColumns
     * @return User|bool
     */
    public function getResultRowObject($returnColumns = null, $omitColumns = null)
    {
        if (! $this->resultRow) {
            return false;
        }

        //$returnObject = new stdClass();

        if (null !== $returnColumns) {
            $availableColumns = array_keys($this->resultRow);
            foreach ((array) $returnColumns as $returnColumn) {
                if (in_array($returnColumn, $availableColumns)) {
                    $this->usrModel->{$returnColumn} = $this->resultRow[$returnColumn];
                }
            }
            return $this->usrModel;
        } elseif (null !== $omitColumns) {
            $omitColumns = (array) $omitColumns;
            foreach ($this->resultRow as $resultColumn => $resultValue) {
                if (! in_array($resultColumn, $omitColumns)) {
                    $this->usrModel->{$resultColumn} = $resultValue;
                }
            }
            return $this->usrModel;
        }

        foreach ($this->resultRow as $resultColumn => $resultValue) {
            $this->usrModel->{$resultColumn} = $resultValue;
        }
        return $this->usrModel;
    }
}