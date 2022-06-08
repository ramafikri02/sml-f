export default [
  {
    title: 'Pick Up',
    icon: 'FolderIcon',
    children: [
      {
        title: 'Pick up Order',
        children: [
          {
            title: 'Entri Pick up Order',
            route: 'pickup-request-entry',
          },
          {
            title: 'Booking Pick up Order',
            route: 'pickup-request-booking',
          },
          {
            title: 'Penugasan Pick up',
            route: 'pickup-request-assignment',
          },
          {
            title: 'Cetak Ulang Pick up Order',
            route: 'pickup-request-reprint',
          },
          {
            title: 'Entri Pick up Order Pelanggan',
            route: 'pickup-request-customer',
          },
        ],
      },
      {
        title: 'Missed Pick up',
        children: [
          {
            title: 'Entri Missed Pick up',
            route: 'pickup-miss-entry',
          },
          {
            title: 'Booking Missed Pick up',
            route: 'pickup-miss-booking',
          },
          {
            title: 'Cetak Ulang Missed Pick up',
            route: 'pickup-miss-reprint',
          },
          {
            title: 'Pembatalan Missed Pick up',
            route: 'pickup-miss-void',
          },
        ],
      },
      {
        title: 'Pick up Confirmation',
        children: [
          {
            title: 'Entri Pick up Confirmation',
            route: 'pickup-confirmation-entry',
          },
          {
            title: 'Booking Pick up Confirmation',
            route: 'pickup-confirmation-booking',
          },
          {
            title: 'Cetak Ulang Pick up Confirmation',
            route: 'pickup-confirmation-reprint',
          },
        ],
      },
      {
        title: 'Laporan Pick up',
        children: [
          {
            title: 'Laporan Pick up Order Harian',
            route: 'pickup-request-report',
          },
          {
            title: 'Laporan Pick up Confirmation Harian',
            route: 'pickup-confirmation-report',
          },
          {
            title: 'Laporan Missed Pick up',
            route: 'pickup-miss-report',
          },
        ],
      },
    ],
  },
]
