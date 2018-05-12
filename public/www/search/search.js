var options = {
  endpointUrl: '/query',
  filterContainer: 'filter-container',
  resultTypes: ['http://data.archiveshub.ac.uk/def/ArchivalResource'],
  resultList: {
    renderer: window.alod.renderer,
    pageSize: 20,
    preload: 80
  },
  endpoints: {
    '/query': {
      queries: {
        search: 'customStardogResultset',
        count: 'stardogMeta',
        histogram: 'stardogHistogram',
        textmatch: 'customStardogFulltextPart'
      }
    },
    'https://query.wikidata.org/sparql': {
      queries: {
        tagSearch: 'wikidataHlsTagSearch'
      }
    }
  },
  queries: {
    customStardogResultset: document.getElementById('custom-stardog-resultset.sparql').innerHTML,
    customStardogFulltextPart: document.getElementById('custom-stardog-fulltext-part.sparql').innerHTML
  },
  plugins: [
    new Zack.Histogram({
      margin: {top: 0, right: 35, bottom: 40, left: 35},
      height: 120
    }),
    new Zack.TypeFilter({
      predicate: 'http://data.archiveshub.ac.uk/def/level',
      values: {
        'http://data.alod.ch/alod/level/archive': {icon: 'fa-university', title: 'Archives'},
        'http://data.alod.ch/alod/level/fond': {icon: 'fa-archive', title: 'Fonds'},
        'http://data.alod.ch/alod/level/subfond': {icon: 'fa-archive', title: 'Sub-Fonds'},
        'http://data.alod.ch/alod/level/series': {icon: 'fa-sitemap', title: 'Series'},
        'http://data.alod.ch/alod/level/file': {icon: 'fa-folder-open', title: 'Files'},
        'http://data.alod.ch/alod/level/item': {icon: 'fa-file', title: 'Items'}
      }
    }),
    new Zack.Tagger({
      endpointUrl: 'https://query.wikidata.org/sparql'
    }),
    new window.alod.Intro({
      backdrop: true,
      orphan: true,
      steps: [
        { title: 'Welcome to aLOD Search', content: 'We invite you to discover aLOD Search with this interactive tour. You can always restart the tour with the <i class="fa fa-question"></i> in the top corner.'},
        { element: '.zack-content', placement: 'top', title: 'Archival Resources', content: 'All available Archival Resources are shown at once. Just scroll to discover the multititude of different documents.'},
        { element: '.zack-result:first', title: 'Result', content: 'On the left you see which kind of Archival Result the result represents. Further you get the title and diffrent information on the aArchival Resource dependign of the Archive.' },
        { element: '#query', title: 'Filter by Query', content: 'If you look for something specific you can enter keywords to filter the results.' },
        { element: '#type-filters', placement: 'bottom', title: 'Filter by Hierarchy Level', content: 'Filter the results to a specific hierarchy level.<dl>'
          +'<dt>Archives</dt><dd>an independent institution</dd>'
          +'<dt>Fonds</dt><dd>a logical organisation of documents</dd>'
          +'<dt>Sub-Fonds</dt><dd>a logical organisation organisation of documents<dd>'
          +'<dt>Series</dt><dd>a series of related collections or documents</dd>'
          +'<dt>Files</dt><dd>a collection of documents</dd>'
          +'<dt>Items</dt><dd>an individual document</dd></dl>' },
        { element: '.result-tags .actionable:first', title: 'Contribute Tags', content: 'You can contribute to the project by adding your own tags.' }
      ]
    })
  ]
}

window.app = new Zack(options)

window.app.init().catch(function (err) {
  console.error(err)
})
