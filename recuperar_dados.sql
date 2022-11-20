
use ecommerce_r;
 -- recuperar o numero de clientes que eu tenho
 select count(*) from Cliente; 
 
 -- identificar os pedidos feitos pelos clientes
 select * from Cliente c, Pedido o where c.idCliente = idPedidoCliente;
 
 -- especificar os atributos que estou procurando
  select Inome,Fnome, idPedido, pedidoStatus  from cliente c, pessoafisica p, pedido o where c.idCliente = idPedidoCliente;
  
-- Contatenar nome 
  select concat(Inome,' ',Fnome) as Cliente , idPedido, pedidoStatus  from cliente c, pessoafisica p, pedido o where c.idCliente = idPedidoCliente;
  
 select concat(Inome,' ',Fnome) as Cliente , idPedido as Request, pedidoStatus as Status  from cliente c, pessoafisica p, pedido o where c.idCliente = idPedidoCliente;

  -- adicionando mais um linha em pedido
  insert into pedido (idPedidoCliente, pedidoStatus, pedidoDescricao, Frete, formaPagamento)values
						(2,default,'compra via aplicativo',null,1);
                        
 -- contar por grupos   
  
  select * from cliente c inner join pedido o ON c.idCliente = o.idPedidoCliente; 
  -- Recuperar Clientes
  select c.idcliente, c.pessoafisica, p.Inome as nome , p.Fnome as sobrenome 
  from cliente c inner join pessoafisica p on c.pessoafisica = idpessoafisica;
  
 -- contatenar nome completo
  select concat(Inome, Mabrev, Fnome) as Nome_completo from pessoafisica;
                                          
 -- Recuperar quantos pedidos foram realizados  pelos clientes?                          
 select  c.idCliente , pf.Inome as Nome_do_cliente , p.idPedidoCliente, count(*)  as  Quantidade_de_Pedido from cliente c
							inner join pessoafisica pf ON c.pessoafisica = idpessoafisica
                            inner join pedido p ON   c.idCliente = p.idPedidoCliente
					        group by c.idCliente;
                           
   -- Recuperar pedidos que foram Confirmados                        
  select  c.idCliente , pf.Inome as Nome_do_cliente ,p.pedidoStatus, p.idPedidoCliente, count(*)  as  Numero_do_Pedido from cliente c
							inner join pessoafisica pf ON c.pessoafisica = idpessoafisica
                            inner join pedido p ON   c.idCliente = p.idPedidoCliente
					        where pedidostatus = 'Confirmado'  ;  
                            
	-- Recuperar pedidos que foram feitos via web site                  
    select  c.idCliente , pf.Inome as Nome_do_cliente, count(*) ,p.pedidoDescricao, p.idPedidoCliente  as  Numero_do_Pedido from cliente c
							inner join pessoafisica pf ON c.pessoafisica = idpessoafisica
                            inner join pedido p ON   c.idCliente = p.idPedidoCliente
					        where pedidoDescricao = 'compra via web site' ;     
      -- Recuperar quantidade de estoque  por região                      
  select localizacaoEstoque, SUM(quantidade) as Quantidade_de_estoque_por_estado 
  from EstoquePedido
  group by localizacaoEstoque;
  
   -- Recuperar localização de estoque menor igual a 10
   select localizacaoEstoque, quantidade as Quantidade_de_estoque_menor_igual_a_10 
  from EstoquePedido
  having Quantidade <= 10;
  
  -- Recuperar quantidade de pessoas cadastradas por tipo 1=PessaoFisica e 2=PessoaJuridica
 SELECT idtipopessoa, COUNT(*) as pessoa_tipos FROM pessoa
    GROUP BY idtipopessoa 
    HAVING pessoa_tipos != 1;

 