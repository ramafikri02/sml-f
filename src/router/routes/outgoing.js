export default [
  // *===============================================---*
  // *--------- GENERATE SHIPPING BAG ---------------------------------------*
  // *===============================================---*
  {
    path: '/outgoing/generate/shipping-bag',
    name: 'outgoing-generate-shipping-bag',
    component: () => import('@/views/outgoing/generate-shipping-bag/GenerateShippingBag.vue'),
  },
  {
    path: '/outgoing/generate/shipping-bag/list',
    name: 'outgoing-generate-shipping-bag-list',
    component: () => import('@/views/outgoing/generate-shipping-bag/ShippingBagList.vue'),
  },
  {
    path: '/outgoing/generate/shipping-bag/reprint',
    name: 'outgoing-generate-shipping-bag-reprint',
    component: () => import('@/views/outgoing/generate-shipping-bag/ReprintShippingBag.vue'),
  },

  // *===============================================---*
  // *--------- OUTGOING ---------------------------------------*
  // *===============================================---*
  {
    path: '/outgoing/entri',
    name: 'outgoing-entri',
    component: () => import('@/views/outgoing/outgoing/EntriOutgoing.vue'),
  },
  {
    path: '/outgoing/reprint',
    name: 'outgoing-reprint-list',
    component: () => import('@/views/outgoing/outgoing/ReprintOutgoing.vue'),
  },
  {
    path: '/outgoing/void',
    name: 'outgoing-void-list',
    component: () => import('@/views/outgoing/outgoing/VoidOutgoing.vue'),
  },
  {
    path: '/outgoing/booking',
    name: 'outgoing-booking-list',
    component: () => import('@/views/outgoing/outgoing/BookingOutgoing.vue'),
  },

  // *===============================================---*
  // *--------- OUTGOING CONSOL ---------------------------------------*
  // *===============================================---*
  {
    path: '/outgoing/outgoing-consol/entri',
    name: 'outgoing-consol-entri',
    component: () => import('@/views/outgoing/outgoing-consol/EntriOutgoingConsol.vue'),
  },
  {
    path: '/outgoing/outgoing-consol/reprint',
    name: 'outgoing-consol-reprint-list',
    component: () => import('@/views/outgoing/outgoing-consol/ReprintOutgoingConsol.vue'),
  },
  {
    path: '/outgoing/outgoing-consol/void',
    name: 'outgoing-consol-void-list',
    component: () => import('@/views/outgoing/outgoing-consol/VoidOutgoingConsol.vue'),
  },
  {
    path: '/outgoing/outgoing-consol/booking',
    name: 'outgoing-consol-booking-list',
    component: () => import('@/views/outgoing/outgoing-consol/BookingOutgoingConsol.vue'),
  },

  // *===============================================---*
  // *--------- REPORT OUTGOING ---------------------------------------*
  // *===============================================---*
  {
    path: '/outgoing/report/outstanding',
    name: 'outgoing-report-outstanding',
    component: () => import('@/views/outgoing/outgoing-report/OutstandingOutgoingReport.vue'),
  },
  {
    path: '/outgoing/report/outgoing',
    name: 'outgoing-report-outgoing',
    component: () => import('@/views/outgoing/outgoing-report/OutgoingReport.vue'),
  },
  {
    path: '/outgoing/report/deposit',
    name: 'outgoing-report-deposit',
    component: () => import('@/views/outgoing/outgoing-report/DepositReport.vue'),
  },
  {
    path: '/outgoing/report/disbag-manifest',
    name: 'outgoing-report-disbag-manifest',
    component: () => import('@/views/outgoing/outgoing-report/DisbagManifestReport.vue'),
  },
]
