export default [
  // *===============================================---*
  // *--------- DOMESTIC RECEIPT ---------------------------------------*
  // *===============================================---*
  {
    path: '/pos/domestic-receipt/cash',
    name: 'pos-domestic-receipt-cash',
    component: () => import('@/views/pos/domestic-receipt/CashDomestic.vue'),
  },
  {
    path: '/pos/domestic-receipt/credit',
    name: 'pos-domestic-receipt-credit',
    component: () => import('@/views/pos/domestic-receipt/CreditDomestic.vue'),
  },
  {
    path: '/pos/domestic-receipt/cod',
    name: 'pos-domestic-receipt-cod',
    component: () => import('@/views/pos/domestic-receipt/CodDomestic.vue'),
  },
  {
    path: '/pos/domestic-receipt/reprint',
    name: 'pos-domestic-receipt-reprint',
    component: () => import('@/views/pos/domestic-receipt/ReprintDomestic.vue'),
  },
  {
    path: '/pos/domestic-receipt/void',
    name: 'pos-domestic-receipt-void',
    component: () => import('@/views/pos/domestic-receipt/VoidDomestic.vue'),
  },
  {
    path: '/pos/domestic-receipt/booking',
    name: 'pos-domestic-receipt-booking',
    component: () => import('@/views/pos/domestic-receipt/BookingDomestic.vue'),
  },
  // *===============================================---*
  // *--------- PROJECT RESEIPT ---------------------------------------*
  // *===============================================---*
  {
    path: '/pos/project-receipt/cash',
    name: 'pos-project-receipt-cash',
    component: () => import('@/views/pos/project-receipt/CashProject.vue'),
  },
  {
    path: '/pos/project-receipt/credit',
    name: 'pos-project-receipt-credit',
    component: () => import('@/views/pos/project-receipt/CreditProject.vue'),
  },
  {
    path: '/pos/project-receipt/cod',
    name: 'pos-project-receipt-cod',
    component: () => import('@/views/pos/project-receipt/CodProject.vue'),
  },
  {
    path: '/pos/project-receipt/reprint',
    name: 'pos-project-receipt-reprint',
    component: () => import('@/views/pos/project-receipt/ReprintProject.vue'),
  },
  {
    path: '/pos/project-receipt/void',
    name: 'pos-project-receipt-void',
    component: () => import('@/views/pos/project-receipt/VoidProject.vue'),
  },
  {
    path: '/pos/project-receipt/booking',
    name: 'pos-project-receipt-booking',
    component: () => import('@/views/pos/project-receipt/BookingProject.vue'),
  },
  // *===============================================---*
  // *--------- HOUSE MAIL RESEIPT ---------------------------------------*
  // *===============================================---*
  {
    path: '/pos/house-mail-receipt',
    name: 'pos-house-mail-receipt',
    component: () => import('@/views/pos/house-mail-receipt/HouseMail.vue'),
  },
  {
    path: '/pos/house-mail-receipt/reprint',
    name: 'pos-house-mail-receipt-reprint',
    component: () => import('@/views/pos/house-mail-receipt/ReprintHouseMail.vue'),
  },
  {
    path: '/pos/house-mail-receipt/void',
    name: 'pos-house-mail-receipt-void',
    component: () => import('@/views/pos/house-mail-receipt/VoidHouseMail.vue'),
  },
  {
    path: '/pos/house-mail-receipt/booking',
    name: 'pos-house-mail-receipt-booking',
    component: () => import('@/views/pos/house-mail-receipt/BookingHouseMail.vue'),
  },
  // *===============================================---*
  // *--------- API RESEIPT ---------------------------------------*
  // *===============================================---*
  {
    path: '/pos/api-receipt/booking',
    name: 'pos-api-receipt-booking',
    component: () => import('@/views/pos/api-receipt/BookingApiShipment.vue'),
  },
]
