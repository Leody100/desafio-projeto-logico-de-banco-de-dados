**

## Projeto Banco de Dados Logico 
## E-COMMERCE refinado

**

Projeto Lógico de Banco de Dados utiliizando o Modelo refinado E-COMMERCE
no Bootcamp Geração Tech Unimed-BH criado na Plataforma [Dio.me](https://www.dio.me/) com a orientação da Especialista Juliana Mascarenhas - Data Scientist, DIO.

## Projeto:
**Narrativa - Produto**
• Os produtos são vendidos por uma única plataforma online. 
Contudo, estes podem ter vendedores distintos (terceiros)
• Cada produto possui um fornecedor
• Um ou mais produtos podem compor um pedido

**Narrativa - Cliente**
 • Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações; 
• O Endereço do cliente irá determinar o valor do frete
• Um cliente pode comprar mais de um pedido. Este tem um período
de carência para devolução do produto

**Narrativa – Pedido**
• O pedidos são criados por clientes e possuem informações de 
compra, endereço e status da entrega
• Um produto ou mais compoem o pedido
• O pedido pode ser cancelado

**Narrativa – Fornecedor & estoque**
• O fornecedor (exclusivos) e Terceiros(Vendedor) podem ser cadastrados no site com seu CNPJ. 
• Produto compoem quantidades em estoque e armazenados em local especifico

**Narrativa – Pagamento & entrega**
• Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
• Entrega – Possui status e código de rastreio;

 **Mais detalhes** 
• Foi acrescentado a Entidade Pessoa que se divide em mais duas Pessoa Fisica e Pessoa Juridica onde são apresentados a escolha do tipos de pessoas:
Cliente, Fornecedor e Terceiros.  No caso do pagamento foi criada a Entidade Pagamento que no caso possui duas formas :Cartão de credito e Boleto.
• As tabelas foram populadas foi acrecentado scripts, querys

**Ferramenta Utilizada:**
   Mysql Workbench

