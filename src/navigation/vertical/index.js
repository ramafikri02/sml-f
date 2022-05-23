/*

Array of object

Top level object can be:
1. Header
2. Group (Group can have navItems as children)
3. navItem

* Supported Options

/--- Header ---/

header

/--- nav Grp ---/

title
icon (if it's on top level)
tag
tagVariant
children

/--- nav Item ---/

icon (if it's on top level)
title
route: [route_obj/route_name] (I have to resolve name somehow from the route obj)
tag
tagVariant

*/
import dashboard from './dashboard'
import masterData from './master-data'
import tarif from './tarif'
import tracing from './tracing'
import pickup from './pickup'
import pickupRunsheet from './pickup-runsheet'
import entriDataResi from './pos'
import cashRegister from './cash-register'
import laporanTransaksi from './laporan-transaksi'
import outgoing from './outgoing'
import transit from './transit'
import incoming from './incoming'
import delivery from './delivery'
import pod from './pod'
import ap from './ap'
import suratMuatan from './surat-muatan'
import ar from './ar'
import penyetoranPod from './penyetoran-pod'
import appsAndPages from './apps-and-pages'
import others from './others'
import chartsAndMaps from './charts-and-maps'
import uiElements from './ui-elements'
import formAndTable from './forms-and-table'

// Array of sections
export default [...dashboard, ...masterData, ...tarif, ...tracing, ...pickup, ...pickupRunsheet, ...entriDataResi, ...cashRegister, ...laporanTransaksi, ...outgoing, ...transit, ...incoming, ...delivery, ...pod, ...ap, ...suratMuatan, ...ar, ...penyetoranPod, ...appsAndPages, ...uiElements, ...formAndTable, ...chartsAndMaps, ...others]
