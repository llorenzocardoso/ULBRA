<h1>Inserindo Cliente</h1>
    <form class="form" action="<?=base_url('admin/insertClientAction')?>" method="post" enctype='multipart/form-data'>
        <div class="mb-3 mt-3">
            <label class="form-label">Nome</label>
            <input name="name" class="form-control" placeholder="Nome Completo" required type="text">
        </div>

        <div class="mb-3 mt-3">
            <label class="form-label">Email</label>
            <input name="email" class="form-control" placeholder="exemplo@gmail.com" required type="email">
        </div>

        <div class="mb-3 mt-3">
            <label class="form-label">Telefone</label>
            <input name="phone" class="form-control" placeholder="Digite seu telefone, exemplo: +5551999999999" required type="text">
        </div>
        
        <div class="mb-3 mt-3">
            <label class="form-label">Endereço</label>
            <input name="address" class="form-control" placeholder="Digite seu endereço" required type="text">
        </div>

        <input class="btn btn-primary" type="submit" value="Enviar">
    </form>