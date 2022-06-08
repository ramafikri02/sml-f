export default [
  {
    title: 'Incoming',
    icon: 'FolderIcon',
    children: [
      {
        title: 'Incoming',
        children: [
          {
            title: 'Entri Incoming',
            route: 'incoming-entri',
          },
          {
            title: 'Batal / Tunda Incoming',
            route: 'incoming-void',
          },
          {
            title: 'Daftar Incoming',
            route: 'incoming-list',
          },
          {
            title: 'Cetak Ulang Incoming',
            route: 'incoming-reprint',
          },
        ],
      },
      {
        title: 'Laporan',
        children: [
          {
            title: 'Laporan Harian Incoming',
            route: 'incoming-report-daily',
          },
          {
            title: 'Laporan Outstanding Incoming',
            route: 'incoming-report-outstanding',
          },
        ],
      },
    ],
  },
]
