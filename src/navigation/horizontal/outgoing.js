export default [
  {
    header: 'Outgoing',
    icon: 'FolderIcon',
    children: [
      {
        title: 'Generate Shipping Bag',
        children: [
          {
            title: 'Generate Shipping Bag',
            route: 'outgoing-generate-shipping-bag',
          },
          {
            title: 'Daftar Shipping Bag',
            route: 'outgoing-generate-shipping-bag-list',
          },
          {
            title: 'Cetak Ulang Shipping Bag',
            route: 'outgoing-generate-shipping-bag-reprint',
          },
        ],
      },
      {
        title: 'Outgoing',
        children: [
          {
            title: 'Entri Outgoing',
            route: 'outgoing-entri',
          },
          {
            title: 'Cetak Ulang Outgoing',
            route: 'outgoing-reprint-list',
          },
          {
            title: 'Pembatalan Outgoing',
            route: 'outgoing-void-list',
          },
          {
            title: 'Booking Outgoing',
            route: 'outgoing-booking-list',
          },
        ],
      },
      {
        title: 'Outgoing Consol',
        children: [
          {
            title: 'Entri Outgoing Consol',
            route: 'outgoing-consol-entri',
          },
          {
            title: 'Cetak Ulang Outgoing Consol',
            route: 'outgoing-consol-reprint-list',
          },
          {
            title: 'Pembatalan Outgoing Consol',
            route: 'outgoing-consol-void-list',
          },
          {
            title: 'Booking Outgoing Consol',
            route: 'outgoing-consol-booking-list',
          },
        ],
      },
      {
        title: 'Laporan Outgoing',
        children: [
          {
            title: 'Laporan Outstanding Outgoing',
            route: 'outgoing-report-outstanding',
          },
          {
            title: 'Laporan Outgoing',
            route: 'outgoing-report-outgoing',
          },
          {
            title: 'Laporan Barang Titipan',
            route: 'outgoing-report-deposit',
          },
          {
            title: 'Laporan Rekap Disbag Manifest',
            route: 'outgoing-report-disbag-manifest',
          },
        ],
      },
    ],
  },
]
