const { onCall, HttpsError } = require("firebase-functions/v2/https");
const crypto = require("crypto");

/**
 * Função Cloud Function que gera URLs seguras para vídeos armazenados no Bunny CDN
 *
 * @param {Object} request - Objeto de requisição do Firebase Functions
 * @param {Object} request.data - Dados enviados na requisição
 * @param {string} request.data.path - Caminho do vídeo no Bunny CDN
 * @param {Object} request.auth - Informações de autenticação do usuário
 * @returns {Object} Objeto contendo a URL segura
 */
exports.getVideoUrl = onCall({ region: "us-central1" }, (request) => {
  const { data, auth } = request;

  // Validação de entrada
  if (!data?.path) {
    throw new HttpsError(
      'invalid-argument',
      'O parâmetro "path" é obrigatório',
      { field: 'path' }
    );
  }

  const videoPath = data.path;
  const baseUrl = "https://nave-stg.b-cdn.net";
  const bunnyTokenKey = "bunny-token-key";

  // Para vídeos públicos, retorna URL direta sem token
  if (videoPath.startsWith("public/")) {
    return { url: `${baseUrl}/${videoPath}` };
  }

  // Requer autenticação para vídeos privados
  if (!auth) {
    throw new HttpsError(
      'unauthenticated',
      'Login necessário para acessar este conteúdo',
      { requiresLogin: true }
    );
  }

  try {
    // Configuração de expiração (15 minutos)
    const expires = Math.floor(Date.now() / 1000) + 900;

    // O caminho deve começar com /
    const path = `/${videoPath}`;

    // String a ser assinada: chave + caminho + expires
    const hashableString = bunnyTokenKey + path + expires;

    // Gerar token usando SHA256
    const hash = crypto.createHash('sha256').update(hashableString).digest();
    const token = Buffer.from(hash)
      .toString('base64')
      .replace(/\+/g, '-')
      .replace(/\//g, '_')
      .replace(/=/g, '')
      .replace(/\n/g, '');

    // Construir a URL segura
    const secureUrl = `${baseUrl}${path}?token=${token}&expires=${expires}`;

    return { url: secureUrl };
  } catch (error) {
    console.error('Erro ao gerar URL segura:', error);
    throw new HttpsError(
      'internal',
      'Erro ao gerar URL do vídeo',
      { originalError: error.message }
    );
  }
});