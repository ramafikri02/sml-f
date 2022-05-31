<template>
  <div class="container">
    <b-table
      responsive="sm"
      :bordered="true"
      :outlined="true"
      :fields="fields"
      :items="items"
    >
      <template #cell(no)="data">
        {{ data.index + 1 }}
      </template>
    </b-table>
  </div>
</template>

<script>
import { BTable } from 'bootstrap-vue'

export default {
  components: {
    BTable,
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
          tanggal: '17-05-2022 16:09 ',
          asal: 'BANDUNG ',
          tujuan: 'PONTIANAK ',
          nopol: '',
          keterangan: ' BARANG DI ANTAR KE JAKARTA',
          transit: 'JAKARTA ',
          status_incoming: '',
          tipe_manifest: 'MANIFEST DARAT',
          jml_kiriman: '116',
          berat: '2,320.00',
          total_biaya_kirim: '22,000,000.00',
        },
        {
          no: '',
          no_disbag_manifest: 'DMOBDO000000594', 
          no_shipping_bag: 'BDOBAG0003586',
          tanggal: '19-05-2022 00:00',
          asal: 'BANDUNG',
          tujuan: 'JAKARTA',
          nopol: '',
          keterangan: 'BARANG DI DOORING OOLEH ANT',
          transit: '',
          status_incoming: 'MANIFEST DARAT',
          tipe_manifest: '',
          jml_kiriman: '25',
          berat: '358.31',
          total_biaya_kirim: '472,500.00',
        },
        {
          no: '',
          no_disbag_manifest: 'DMOBDO000000595', 
          no_shipping_bag: 'BDOBAG0003588', 
          tanggal: '19-05-2022 00:00',
          asal: 'BANDUNG',
          tujuan: 'JAKARTA',
          nopol: '',
          keterangan: 'BARANG DI DOORING OLEH ANT',
          transit: 'BOGOR',
          status_incoming: '',
          tipe_manifest: 'MANIFEST DARAT',
          jml_kiriman: '25',
          berat: '358.31',
          total_biaya_kirim: '1,260,000.00',
        },
      ],
    }
  },
}
</script>

<style lang="scss">
@import '@assets/scss/custom/preview-table-custom.scss';
</style>
