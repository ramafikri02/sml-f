export default [
  {
    title: 'Entri Data Resi',
    icon: 'FolderIcon',
    children: [
      {
        title: 'Entri Resi Domestic',
        children: [
          {
            title: 'Resi Cash Domestic',
            route: 'pos-domestic-receipt-cash',
          },
          {
            title: 'Resi Credit Domestic',
            route: 'pos-domestic-receipt-credit',
          },
          {
            title: 'Resi COD Domestic',
            route: 'pos-domestic-receipt-cod',
          },
          {
            title: 'Cetak Ulang Resi Domestic',
            route: 'pos-domestic-receipt-reprint',
          },
          {
            title: 'Batalkan Resi Domestic',
            route: 'pos-domestic-receipt-void',
          },
          {
            title: 'Booking Resi Domestic',
            route: 'pos-domestic-receipt-booking',
          },
        ],
      },
      {
        title: 'Entri Resi Project',
        children: [
          {
            title: 'Resi Cash Project',
            route: 'pos-project-receipt-cash',
          },
          {
            title: 'Resi Credit Project',
            route: 'pos-project-receipt-credit',
          },
          {
            title: 'Resi COD Project',
            route: 'pos-project-receipt-cod',
          },
          {
            title: 'Cetak Ulang Resi Project',
            route: 'pos-project-receipt-reprint',
          },
          {
            title: 'Batalkan Resi Project',
            route: 'pos-project-receipt-void',
          },
          {
            title: 'Booking Resi Project',
            route: 'pos-project-receipt-booking',
          },
        ],
      },
      {
        title: 'Entri Resi House Mail',
        children: [
          {
            title: 'Resi House Mail',
            route: 'pos-house-mail-receipt',
          },
          {
            title: 'Cetak Ulang Resi House Mail',
            route: 'pos-house-mail-receipt-reprint',
          },
          {
            title: 'Batalkan Resi House Mail',
            route: 'pos-house-mail-receipt-void',
          },
          {
            title: 'Booking Resi House Mail',
            route: 'pos-house-mail-receipt-booking',
          },
        ],
      },
      {
        title: 'Resi API',
        children: [
          {
            title: 'Booking Rest API Shipment',
            route: 'pos-api-receipt-booking',
          },
        ],
      },
    ],
  },
]
