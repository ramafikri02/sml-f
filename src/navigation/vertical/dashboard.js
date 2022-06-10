export default [
  {
    header: 'Dashboard',
  },
  {
    title: 'Dashboards',
    icon: 'FolderIcon',
    tag: '2',
    tagVariant: 'light-warning', 
    children: [
      {
        title: 'EIS',
        route: 'dashboard-statistics',
        // action: 'manage',
        // resource: 'Marketing',
        action: 'read',
        // resource: 'ACL',
        resource: 'Marketing' || 'Test',
      },
      {
        title: 'EISC',
        route: 'dashboard-show-pdf',
      },
      {
        title: 'ESIS',
        route: 'dashboard-management-sales',
      },
      {
        title: 'EIM',
        route: 'dashboard-dashboard-marketing',
      },
    ],
  },
]
