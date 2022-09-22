# Refinando-um-Projeto-Conceitual-de-Banco-de-Dados-E-COMMERCE
Refine o modelo apresentado acrescentando os seguintes pontos:  Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações; Pagamento – Pode ter cadastrado mais de uma forma de pagamento; Entrega – Possui status e código de rastreio;


CREATE TABLE ECOMMERCE (

  Nome varchar(100),

  Id int(3),

  forma de pagamento varchar(50),

  status da entrega varchar(50),
  
  codigo de rastreio int(5)

);


INSERT INTO ECOMMERCE (nome, id, forma de pagamento, status da entrega, codigo de rastreio) VALUES 

  (‘Maria Souza’, 1, ‘Débito’, Pendente, 34567),

  (‘João Silva’, 2, ‘Crédito’, A confirmar, 12345),

  (‘Ana Flores’, 3, ‘Pix’, Concluída, 89076),

  (‘João Santos’, 4, ‘Crédito’, Concluída, 34567);
  
  
  
nome        id forma de pagamento status da entrega codigo de rastreio
Maria Souza 1  Débito             Pendente          34567
João Silva  2  Crédito            A confirmar       12345
Ana Flores  3  Pix                Concluída         89076
João Santos 4  Crédito            Concluída         34567
