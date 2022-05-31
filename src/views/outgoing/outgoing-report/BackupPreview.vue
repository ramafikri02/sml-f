<template>
  <div class="container">
    <b-table
      responsive="sm"
      :bordered="true"
      :outlined="true"
      :fields="fields"
      :items="items"
    >
      <template #thead-top>
        <b-tr>
          <b-td colspan="11" class="text-right">
            Total
          </b-td>
          <b-td>
            126
          </b-td>
          <b-td>
            182.00
          </b-td>
          <b-td>
            23,130,000.00
          </b-td>
        </b-tr>
      </template>
      <template #cell(no)="data">
        {{ data.index + 1 }}
      </template>
    </b-table>
  </div>
</template>

<script>
import { BTable, BTr, BTh, BTd } from 'bootstrap-vue'

export default {
  components: {
    BTable,
    BTr,
    BTh,
    BTd
  },
  data() {
    return {
      fields: [
        { key: 'no', label: 'No.' },
        { key: 'no_disbag_manifest', label: 'No. Disbag Manifest' },
        { key: 'no_shipping_bag', label: 'No. Shipping Bag' },
        { key: 'date', label: 'Tanggal' },
        { key: 'origin', label: 'Asal' },
        { key: 'destination', label: 'Tujuan' },
        { key: 'nopol', label: 'Nopol' },
        { key: 'description', label: 'Keteragan' },
        { key: 'transit', label: 'Transit' },
        { key: 'status_incoming', label: 'Status Incoming' },
        { key: 'tipe_manifest', label: 'Tipe Manifest' },
        { key: 'jml_kiriman', label: 'Jumlah Kiriman' },
        { key: 'weight', label: 'Berat' },
        { key: 'total_shipping_cost', label: 'Total Biaya Kirim' },
        { key: 'total_shipping_cost', label: 'Total Biaya Kirim' },
      ],
      items: [
        {
          no: '',
          no_disbag_manifest: 'DMOBDO000000582', 
          no_shipping_bag: 'BDOBAG0003544', 
          date: ' 11-05-2022 14:24',
          origin: 'BANDUNG',
          destination: 'PALEMBANG',
          nopol: '',
          description: 'BARANG SUDAH DI PICKUP',
          transit: 'JAKARTA',
          status_incoming: '',
          tipe_manifest: 'MANIFEST DARAT',
          jml_kiriman: '10',
          weight: '180.00',
          total_shipping_cost: '1,130,000.00',
        },
        {
          no: '',
          no_disbag_manifest: 'DMOBDO000000583', 
          no_shipping_bag: 'BDOBAG0003558', 
          date: '17-05-2022 16:09 ',
          origin: 'BANDUNG ',
          destination: 'PONTIANAK ',
          nopol: '',
          description: ' BARANG DI ANTAR KE JAKARTA',
          transit: 'JAKARTA ',
          status_incoming: '',
          tipe_manifest: 'MANIFEST DARAT',
          jml_kiriman: '116',
          weight: '2,320.00',
          total_shipping_cost: '22,000,000.00',
        },
        {
          no: '',
          no_disbag_manifest: 'DMOBDO000000594', 
          no_shipping_bag: 'BDOBAG0003586',
          date: '19-05-2022 00:00',
          origin: 'BANDUNG',
          destination: 'JAKARTA',
          nopol: '',
          description: 'BARANG DI DOORING OOLEH ANT',
          transit: '',
          status_incoming: '',
          tipe_manifest: 'MANIFEST DARAT',
          jml_kiriman: '25',
          weight: '358.31',
          total_shipping_cost: '472,500.00',
        },
        {
          no: '',
          no_disbag_manifest: 'DMOBDO000000595', 
          no_shipping_bag: 'BDOBAG0003588', 
          date: '19-05-2022 00:00',
          origin: 'BANDUNG',
          destination: 'JAKARTA',
          nopol: '',
          description: 'BARANG DI DOORING OLEH ANT',
          transit: 'BOGOR',
          status_incoming: '',
          tipe_manifest: 'MANIFEST DARAT',
          jml_kiriman: '25',
          weight: '358.31',
          total_shipping_cost: '1,260,000.00',
        },
      ],
    }
  },
}
</script>

<style lang="scss">
@import '@assets/scss/custom/preview-table-custom.scss';
</style>
