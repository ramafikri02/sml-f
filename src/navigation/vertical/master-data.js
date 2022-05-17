export default [
  {
    title: 'Data Master',
    icon: 'FolderIcon',
    children: [
      {
        title: 'Pengguna',
        children: [
          {
            title: 'Pengguna',
            route: 'masterdata-users-list',
          },
        ],
      },
      {
        title: 'System',
        children: [
          {
            title: 'Grup Menu',
            route: 'masterdata-group-menu-list',
          },
        ],
      },
      {
        title: 'Organisasi',
        children: [
          {
            title: 'Cabang',
            route: 'masterdata-branch-list',
          },
          {
            title: 'Kantor Cabang',
            route: 'masterdata-branch-office-list',
          },
          {
            title: 'Karyawan',
            route: 'masterdata-employees-list',
          },
          {
            title: 'Coverage Area',
            route: 'masterdata-coverage-area-list',
          },
          {
            title: 'Kurir / Driver',
            route: 'masterdata-courier-list',
          },
          {
            title: 'Helper',
            route: 'masterdata-helper-list',
          },
          {
            title: 'Armada',
            route: 'masterdata-vehicle-list',
          },
          {
            title: 'Faktur',
            route: 'masterdata-pic-invoice-list',
          },
        ],
      },
      {
        title: 'Vendor',
        children: [
          {
            title: 'Data Vendor',
            route: 'masterdata-vendor-list',
          },
        ],
      },
      {
        title: 'Pelanggan',
        children: [
          {
            title: 'Data Pelanggan',
            route: 'masterdata-customer-list',
          },
          {
            title: 'Kontrak Pelanggan',
            route: 'masterdata-customer-contract-list',
          },
        ],
      },
      {
        title: 'Performa Marketing',
        children: [
          {
            title: 'Target Pelanggan',
            route: 'masterdata-customer-target-list',
          },
          {
            title: 'Target Sales',
            route: 'masterdata-sales-target-list',
          },
        ],
      },
    ],
  },
]
