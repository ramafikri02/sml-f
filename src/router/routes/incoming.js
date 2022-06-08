export default [
  // *===============================================---*
  // *--------- Incoming ---------------------------------------*
  // *===============================================---*
  {
    path: '/incoming',
    name: 'incoming-entri',
    component: () => import('@/views/incoming/incoming/EntriIncoming.vue'),
  },
  {
    path: '/incoming/void',
    name: 'incoming-void',
    component: () => import('@/views/incoming/incoming/VoidIncoming.vue'),
  },
  {
    path: '/incoming/list',
    name: 'incoming-list',
    component: () => import('@/views/incoming/incoming/ListIncoming.vue'),
  },
  {
    path: '/incoming/reprint',
    name: 'incoming-reprint',
    component: () => import('@/views/incoming/incoming/ReprintIncoming.vue'),
  },
  // *===============================================---*
  // *--------- Report ---------------------------------------*
  // *===============================================---*
  {
    path: '/incoming/report/daily',
    name: 'incoming-report-daily',
    component: () => import('@/views/incoming/report/DailyReportIncoming.vue'),
  },
  {
    path: '/incoming/report/outstanding',
    name: 'incoming-report-outstanding',
    component: () => import('@/views/incoming/report/OutstandingReportIncoming.vue'),
  }
]