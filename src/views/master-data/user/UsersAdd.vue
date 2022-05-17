<template>
  <b-card
    title="Tambah Pengguna"
  >
    <b-col lg="6">
      <b-form @submit.prevent>
        <b-row>
          <b-col cols="12">
            <b-form-group
              label="Kode Pengguna"
              label-for="h-first-name"
              label-cols-md="4"
            >
              <b-form-input
                id="h-first-name"
                placeholder="Kode Pengguna"
              />
            </b-form-group>
          </b-col>
          <b-col cols="12">
            <b-form-group
              label="Nama Pengguna"
              label-for="h-first-name"
              label-cols-md="4"
            >
              <b-form-input
                id="h-first-name"
                placeholder="Nama Pengguna"
              />
            </b-form-group>
          </b-col>
          <b-col cols="12">
            <b-form-group
              label="Kata Sandi"
              label-for="h-password"
              label-cols-md="4"
            >
              <b-form-input
                id="h-password"
                type="password"
                placeholder="Kata Sandi"
              />
            </b-form-group>
          </b-col>
          <b-col cols="12">
            <b-form-group
              label="Konfirmasi Kata Sandi"
              label-for="h-password2"
              label-cols-md="4"
            >
              <b-form-input
                id="h-password2"
                type="password"
                placeholder="Kata Sandi"
              />
            </b-form-group>
          </b-col>
          <b-col cols="12">
            <b-form-group
              label="Cabang Pengguna"
              label-for="h-cabang"
              label-cols-md="4"
            >
              <v-select
                id="h-cabang"
                v-model="selectedCabang"
                :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                :options="option"
                label="title"
                placeholder="Pilih..."
              />
            </b-form-group>
          </b-col>
          <b-col cols="12">
            <b-form-group
              label="Kantor Cabang"
              label-for="h-kantor-cabang"
              label-cols-md="4"
            >
              <v-select
                id="h-kantor-cabang"
                v-model="selectedKantorCabang"
                :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                :options="option"
                label="title"
                placeholder="Pilih..."
              />
            </b-form-group>
          </b-col>
          <b-col cols="12">
            <b-form-group
              label="ID Akun"
              label-for="h-id-akun"
              label-cols-md="4"
            >
              <v-select
                id="h-id-akun"
                v-model="selectedIdAkun"
                :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                :options="option2"
                label="title"
                placeholder="Pilih..."
              />
            </b-form-group>
          </b-col>
          <b-col cols="12">
            <b-form-group
              label="ID Pegawai"
              label-for="h-id-pegawai"
              label-cols-md="4"
            >
              <v-select
                id="h-id-pegawai"
                v-model="selectedIdPegawai"
                :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                :options="option2"
                label="title"
                placeholder="Pilih..."
              />
            </b-form-group>
          </b-col>
          <b-col cols="12">
            <b-form-group
              label="Grup Pengguna"
              label-for="h-grup-pengguna"
              label-cols-md="4"
            >
              <v-select
                id="h-grup-pengguna"
                v-model="selectedGrupPengguna"
                :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                :options="option"
                label="title"
                placeholder="Pilih..."
              />
            </b-form-group>
          </b-col>
          <b-col cols="12">
            <b-form-group
              label="Multiple Login"
              label-for="h-multiple-login"
              label-cols-md="4"
            >
              <v-select
                id="h-multiple-login"
                v-model="selectedMultipleLogin"
                :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                :options="option3"
                label="title"
                placeholder="Pilih..."
              />
            </b-form-group>
          </b-col>
          <b-col cols="12">
            <b-form-group
              label="Company ID"
              label-for="h-company-id"
              label-cols-md="4"
            >
              <v-select
                id="h-company-id"
                v-model="selectedCompanyId"
                :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                :options="option2"
                label="title"
                placeholder="Pilih..."
              />
            </b-form-group>
          </b-col>

          <!-- submit and reset -->
          <b-col offset-md="4">
            <b-button
              v-ripple.400="'rgba(255, 255, 255, 0.15)'"
              type="submit"
              variant="primary"
              class="mr-1"
            >
              Submit
            </b-button>
            <b-button
              v-ripple.400="'rgba(186, 191, 199, 0.15)'"
              type="reset"
              variant="danger"
              class="mr-1"
            >
              Reset
            </b-button>
            <b-button
              v-ripple.400="'rgba(186, 191, 199, 0.15)'"
              type="reset"
              variant="warning"
              class="mt-1"
              @click="redirectToUsersList()"
            >
              Kembali
            </b-button>
          </b-col>
        </b-row>

      </b-form>
    </b-col>
  </b-card>
</template>

<script>
import {
  BCard, BRow, BCol, BFormGroup, BFormInput, BForm, BButton,
} from 'bootstrap-vue'
import Ripple from 'vue-ripple-directive'
import vSelect from 'vue-select'

export default {
  components: {
    BCard,
    BRow,
    BCol,
    BFormGroup,
    BFormInput,
    BForm,
    BButton,
    vSelect,
  },
  directives: {
    Ripple,
  },
  data() {
    return {
      selectedCabang: '',
      selectedKantorCabang: '',
      selectedIdAkun: '',
      selectedIdPegawai: '',
      selectedGrupPengguna: '',
      selectedMultipleLogin: '',
      selectedCompanyId: '',
      option: [{ title: 'Square' }, { title: 'Rectangle' }, { title: 'Rombo' }, { title: 'Romboid' }],
      option2: [{ title: '1' }, { title: '2' }, { title: '3' }, { title: '4' }],
      option3: [{ title: 'Ya' }, { title: 'Tidak' }],
    }
  },
  methods: {
    redirectToUsersList() {
      this.$router.push({ path: '/masterdata/users/list' })
    },
  },
}
</script>

<style lang="scss">
@import '@core/scss/vue/libs/vue-select.scss';
</style>
