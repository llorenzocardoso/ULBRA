<?php

namespace App\Models;

use CodeIgniter\Model;

class ClientModel extends Model{

    protected $table = 'clients';
    protected $primaryKey = 'idClient';
    protected $allowedFields =[
        'name', 'email', 'phone','address'
    ];

    public function getClients($idClient = null){
        if($idClient == null):
            return $this -> findAll();
        else:
            return $this -> find($idClient);
        endif;
    }

    public function getSearchClient($data){
        return $this -> asArray() 
        -> like('idClient', $data)
        -> orLike('name', $data)
        -> orLike('phone', $data)
        -> orLike('email', $data)
        -> orLike('address',  $data)
        -> findAll();
    }
}