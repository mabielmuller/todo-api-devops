const request = require('supertest');
const app = require('../src/index');

describe('GET /tarefas', () => {
  it('deve retornar uma lista de tarefas (vazia por padrão)', async () => {
    const res = await request(app).get('/tarefas');
    expect(res.statusCode).toBe(200);
    expect(Array.isArray(res.body)).toBe(true);
  });
});
