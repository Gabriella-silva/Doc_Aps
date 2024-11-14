const express = require("express");
const app = express();
const Sequelize = require("sequelize");
const Cors = require('cors')

app.use(Cors())


const conexaoComBanco = new Sequelize("test", "root", "", {
    host: "localhost",
    dialect: "mysql",
  });
  const Aluno = conexaoComBanco.define("alunos", {
    nome: {
      type: Sequelize.STRING,
    },
    serie: {
        type: Sequelize.INTEGER,
    },

    turma: {
      type: Sequelize.INTEGER,
    },

  });
  
  Aluno.sync({ force: false });

  

  app.get("/mostrar", async function (req, res) {
    try {
        const alunos = await Aluno.findAll(); // Busca todos os registros
        res.json(alunos); // Retorna os registros em formato JSON
    } catch (error) {
        res.status(500).json({ message: `Erro ao buscar alunos: ${error}` }); // Retorna erro ao cliente
    }
});
  
  app.listen(3031, function () {
    console.log("Server is running on port 3031");
  });
