# Refinando-um-Projeto-Conceitual-de-Banco-de-Dados-E-COMMERCE
Refine o modelo apresentado acrescentando os seguintes pontos:  Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações; Pagamento – Pode ter cadastrado mais de uma forma de pagamento; Entrega – Possui status e código de rastreio;


CREATE TABLE ECOMMERCE (

  Nome varchar(100),

  Id int(3),

  Pagamento varchar(50),

  Entrega varchar(50)

);


INSERT INTO ECOMMERCE (nome, id, forma de pagamento, status da entrega) VALUES 

  (‘Maria Souza’, 1, ‘Débito’, Pendente),

  (‘João Silva’, 2, ‘Crédito’, A confirmar),

  (‘Ana Flores’, 3, ‘Pix’, Concluída),

  (‘João Santos’, 4, ‘Crédito’, Concluída);
  
  
  
nome        id forma de pagamento status da entrega
Maria Souza 1  Débito             Pendente
João Silva  2  Crédito            A confirmar
Ana Flores  3  Pix                Concluída
João Santos 4  Crédito            Concluída
