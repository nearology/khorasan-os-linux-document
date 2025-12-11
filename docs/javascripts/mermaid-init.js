(function () {
  function initMermaid() {
    if (window.mermaid && typeof window.mermaid.initialize === 'function') {
      try {
        // Initialize once per page render; SPA transitions are handled below
        window.mermaid.initialize({ startOnLoad: false, securityLevel: 'loose' });
        window.mermaid.init(undefined, document.querySelectorAll('.mermaid'));
      } catch (e) {
        console.warn('Mermaid init failed:', e);
      }
    }
  }

  // Initial load
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initMermaid);
  } else {
    initMermaid();
  }

  // Re-init on MkDocs Material page transitions (instant loading)
  if (window.document$ && typeof window.document$.subscribe === 'function') {
    window.document$.subscribe(initMermaid);
  }
})();
