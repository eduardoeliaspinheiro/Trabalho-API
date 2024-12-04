document.addEventListener('DOMContentLoaded', () => {
  const factContainer = document.getElementById('fact');
  const factsList = document.getElementById('facts-ul');
  const logsList = document.getElementById('logs-ul');
  const apiBaseUrl = 'http://localhost/cat_facts_site/backend.php';

  // Função para buscar e exibir fatos
  const fetchCatFact = async () => {
    try {
      const response = await fetch('https://catfact.ninja/fact');
      if (!response.ok) {
        throw new Error('Failed to fetch fact');
      }

      const data = await response.json();
      factContainer.textContent = data.fact;

      // Salvar fato no banco de dados
      await fetch(apiBaseUrl, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ fact: data.fact, length: data.fact.length })
      });

      // Registrar log
      await logAPIRequest(1); // Um fato registrado
      fetchFactsFromDB();
      fetchLogsFromDB();
    } catch (error) {
      console.error('Error fetching fact:', error);
      factContainer.textContent = 'Failed to fetch fact. Try again later.';
    }
  };

  // Função para registrar log no banco de dados
  const logAPIRequest = async (numberOfRecords) => {
    try {
      await fetch(apiBaseUrl, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ numeroregistros: numberOfRecords })
      });
    } catch (error) {
      console.error('Error logging API request:', error);
    }
  };

  // Função para exibir fatos do banco de dados
  const fetchFactsFromDB = async () => {
    try {
      const response = await fetch(apiBaseUrl);
      const facts = await response.json();

      factsList.innerHTML = '';
      facts.forEach(fact => {
        const li = document.createElement('li');
        li.textContent = `Fact: ${fact.fact} (Length: ${fact.length})`;
        factsList.appendChild(li);
      });
    } catch (error) {
      console.error('Error fetching facts:', error);
    }
  };

  // Função para exibir logs do banco de dados
  const fetchLogsFromDB = async () => {
    try {
      const response = await fetch(`${apiBaseUrl}?action=logs`);
      const logs = await response.json();

      logsList.innerHTML = '';
      logs.forEach(log => {
        const li = document.createElement('li');
        li.textContent = `ID: ${log.idlog}, Data: ${log.datahora}, Registros: ${log.numeroregistros}`;
        logsList.appendChild(li);
      });
    } catch (error) {
      console.error('Error fetching logs:', error);
    }
  };

  // Adicionar evento ao botão
  document.getElementById('fetch-fact').addEventListener('click', fetchCatFact);

  // Carregar fatos e logs ao iniciar
  fetchFactsFromDB();
  fetchLogsFromDB();
});
