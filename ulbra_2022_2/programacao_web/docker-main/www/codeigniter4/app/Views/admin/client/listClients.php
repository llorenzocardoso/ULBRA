<div class="row">
    <div class="col-md-9">
        <h2>Listagem de clientes</h1>
    </div>
    <div class="col-md-3">
        <div class="row">
            <div class="col-md-8">
                <form  method="POST" action="<?=base_url("admin/client/buscar-action")?>">
                    <div class="form-group">
                        <div>
                            <input type="text" class="form-control" name="pesquisa">
                        </div>
                    </div>
            </div>
            <div class="col-md-4">
                <button type="submit" class="btn btn-success">Buscar</button>
                </form>
            </div>
        </div>
    </div>   
</div>
<br>
<table class="table table-striped">
    <tr>
        <th>ID do cliente</th>
        <th>Nome</th>
        <th>Email</th>
        <th>Telefone</th>
        <th>Endereço</th>
        <th colspan="2">Ações</th>
    </tr>
<?php
    foreach ($clients as $client){  
?>
    <tr>
        <td>
            <?=$client['idClient']?>
        </td>
        <td>
            <?=$client['name']?>
        </td>
        <td>
            <?=$client['email']?>
        </td>
        <td>
            <?=$client['phone']?>
        </td>
        <td>
            <?=$client['address']?>
        </td>
        <td>
            <a href="<?=base_url('admin/updateClient/'.$client['idClient'])?>" class="btn btn-warning">
                Alterar
            </a>
        </td>
        <td>
            <a href="<?=base_url('admin/deleteClient/'.$client['idClient'])?>" class="btn btn-danger">
                Deletar
            </a>
        </td>
    </tr>
<?php
    }
?>

</table>