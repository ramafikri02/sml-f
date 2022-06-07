<template>
  <div class="report">
    <div class="container">
      <div class="orientation">
        <p class="small_font_Report"><b>saranamulyalogisticscorp.com</b></p>
        <h4 class="text-center"><b>Laporan Disbag Manifest&nbsp;</b></h4>
        <h5 class="text-center">Periode : 11-05-2022 - 17-05-2022</h5>
        <table class="medium_font_Report">
          <tr class="font_size">
              <td width="100px">Cabang</td>
              <td>:</td>
              <td>NASIONAL</td>
          </tr>
          <tr class="font_size">
              <td>Kantor</td>
              <td>:</td>
              <td></td>
          </tr>
          <tr class="font_size">
              <td>Tujuan</td>
              <td>:</td>
              <td></td>
          </tr>
          <tr class="font_size">
              <td>Pengguna</td>
              <td>:</td>
              <td></td>
          </tr>
          <tr class="font_size">
              <td>Tipe Manifest</td>
              <td>:</td>
              <td></td>
          </tr>
        </table>
        <b-table-simple
          responsive
        >
          <b-thead>
            <b-tr>
              <b-th v-for="field in fields" :key="field.key">{{ field.label }}</b-th>
            </b-tr>
          </b-thead>
          <b-tbody>
            <tr v-for="(item,i) in items" :key="i">
              <td>{{ i+1 }}</td>
              <td>{{ item.no_disbag_manifest }}</td>
              <td>{{ item.no_shipping_bag }}</td>
              <td>{{ item.date }}</td>
              <td>{{ item.origin }}</td>
              <td>{{ item.destination }}</td>
              <td>{{ item.nopol }}</td>
              <td>{{ item.description }}</td>
              <td>{{ item.transit }}</td>
              <td>{{ item.status_incoming }}</td>
              <td>{{ item.tipe_manifest }}</td>
              <td>{{ item.jml_kiriman }}</td>
              <td>{{ item.weight.replace(/\B(?=(\d{3})+(?!\d))/g, ',').concat('.00') }}</td>
              <td>{{ item.total_shipping_cost.replace(/\B(?=(\d{3})+(?!\d))/g, ',').concat('.00') }}</td>
            </tr>
          </b-tbody>
          <b-tfoot>
            <b-tr>
              <b-td
                colspan="11"
                class="text-right"
              >
                <b>Total&nbsp;</b>
              </b-td>
              <b-td
                colspan="1"
                class="text-center"
              >
                {{ countShipment }}
              </b-td>
              <b-td
                colspan="1"
                class="text-center"
              >
                {{ contWeight }}
              </b-td>
              <b-td
                colspan="1"
                class="text-center"
              >
                {{ countShipmentCost }}
              </b-td>
            </b-tr>
          </b-tfoot>
        </b-table-simple>
        <table class="small_font_Report">
          <tr>
            <td align="left" >Dicetak Oleh</td>
            <td align="left" >:</td>
            <td align="left" >FIKRISML&nbsp;SML</td>
          </tr>
          <tr>
            <td align="left" >Tanggal Cetak</td>
            <td align="left" >:</td>
            <td align="left" >31-05-2022 10:17</td>
          </tr>
        </table>
        <div class="text-center btn-cetak">
          <b-button
            size="sm"
            class="mr-1"
            id="btnPrint"
            @click="toPrint()"
          >
            Cetak
          </b-button>
          <b-button
            size="sm"
            class="mr-1"
            id="btnExcel"
          >
            Cetak Excel
          </b-button>
          <b-button
            size="sm"
            id="btnClose"
            @click="toClose()"
          >
            Tutup
          </b-button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {
  BTableSimple, BThead, BTr, BTh, BTd, BTbody, BTfoot, BButton
} from 'bootstrap-vue'

export default {
  components: {
    BTableSimple,
    BThead,
    BTr,
    BTh,
    BTd,
    BTbody,
    BTfoot,
    BButton
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
          weight: '180',
          total_shipping_cost: '1130000',
        },
        {
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
          weight: '2,320',
          total_shipping_cost: '22000000',
        },
      ],
    }
  },
  computed: {
    countShipment() {
      return this.items.reduce(function(total, item){
        return total + parseInt(item.jml_kiriman);
      },0);
    },
    contWeight() {
      var sum = this.items.reduce((total, item) => total +  parseInt(item.weight), 0);
      return new Intl.NumberFormat().format(sum)
    },
    countShipmentCost() {
      var sum = this.items.reduce((total, item) => total +  parseInt(item.total_shipping_cost.replace(/,/g, '')), 0);
      console.log('Format Num : ', new Intl.NumberFormat().format(sum))
      console.log('Format Float : ', parseFloat(sum))
      return new Intl.NumberFormat().format(sum) + '.00'
    }
  },
  methods: {
    toPrint() {
      window.print()
    },
    toClose() {
      window.close()
    }
  }
}
</script>

<style lang="scss">
@import '@assets/scss/custom/preview-table-custom.scss';
</style>
    