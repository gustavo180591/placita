console.log('Worker iniciado');

// Configuración básica del worker
import { createClient } from '@redis/client';

const redisClient = createClient({
  url: process.env.REDIS_URL || 'redis://:your-redis-password@localhost:6379'
});

// Manejar errores de conexión
redisClient.on('error', (err) => {
  console.error('Error de Redis:', err);
});

// Conectar a Redis
async function connectToRedis() {
  try {
    await redisClient.connect();
    console.log('Conectado a Redis');
  } catch (error) {
    console.error('Error al conectar a Redis:', error);
    process.exit(1);
  }
}

// Función principal del worker
async function startWorker() {
  console.log('Iniciando worker...');
  
  // Suscribirse a canales o colas de Redis según sea necesario
  // Ejemplo: procesar tareas de una cola
  
  console.log('Worker listo para procesar tareas');
  
  // Mantener el proceso activo
  setInterval(() => {
    // Verificar periódicamente si hay tareas pendientes
    console.log('Worker activo, esperando tareas...');
  }, 30000); // Verificar cada 30 segundos
}

// Manejar la terminación del proceso
process.on('SIGTERM', async () => {
  console.log('Recibida señal de terminación, cerrando conexiones...');
  await redisClient.quit();
  process.exit(0);
});

// Iniciar el worker
(async () => {
  try {
    await connectToRedis();
    await startWorker();
  } catch (error) {
    console.error('Error en el worker:', error);
    process.exit(1);
  }
})();
