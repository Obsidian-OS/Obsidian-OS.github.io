const org = "obsidian-os";
const listEl = document.getElementById("repo-list");
const CACHE_KEY = "obsidian-os-repos";
const CACHE_TTL = 1000 * 60 * 60; // 1 hour

async function fetchRepos(page = 1, all = []) {
  const res = await fetch(`https://api.github.com/orgs/${org}/repos?per_page=100&page=${page}`);
  const repos = await res.json();
  if (repos.length === 0) return all;
  return fetchRepos(page + 1, all.concat(repos));
}

function renderRepos(repos) {
  listEl.innerHTML = ""; // clear any old entries
  repos
    .filter(r => r.name !== ".github")
    .forEach(repo => {
      const a = document.createElement("a");
      a.href = repo.html_url;
      a.textContent = repo.name;
      a.className = "community-link";
      a.target = "_blank";
      listEl.appendChild(a);
    });
}

async function loadRepos() {
  const cached = localStorage.getItem(CACHE_KEY);
  if (cached) {
    const { time, data } = JSON.parse(cached);
    if (Date.now() - time < CACHE_TTL) {
      renderRepos(data);
      console.log("Loaded from cache");
      return;
    }
  }

  console.log("Fetching from GitHub...");
  const repos = await fetchRepos();
  renderRepos(repos);
  localStorage.setItem(CACHE_KEY, JSON.stringify({ time: Date.now(), data: repos }));
}

loadRepos();
