const express = require('express');
const app = express();
app.use(express.json());

const tarefas = [];

app.get('/tarefas', (req, res) => {
  res.json(tarefas);
});

app.post('/tarefas', (req, res) => {
  const { titulo } = req.body;
  const nova = { id: tarefas.length + 1, titulo };
  tarefas.push(nova);
  res.status(201).json(nova);
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`API rodando na porta ${PORT}`);
});

module.exports = app; // para testes
