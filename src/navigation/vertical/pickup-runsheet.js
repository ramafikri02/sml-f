export default [
  {
    title: 'Pick Up Runsheet',
    icon: 'FolderIcon',
    children: [
      {
        title: 'Pick Up Request Runsheet',
        children: [
          {
            title: 'Entri Pick up Runsheet',
            route: 'pick-up-runsheet-entry',
          },
          {
            title: 'Booking Pick up Runsheet',
            route: 'pick-up-runsheet-booking',
          },
          {
            title: 'Cetak Ulang Pick up Runsheet',
            route: 'pick-up-runsheet-reprint',
          },
          {
            title: 'Batalkan Pick up Runsheet',
            route: 'pick-up-runsheet-void',
          },
          {
            title: 'Penugasan Pick up Runsheet',
            route: 'pick-up-runsheet-assignment',
          },
        ],
      },
    ],
  },
]
