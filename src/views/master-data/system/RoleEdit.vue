<template>
  <b-card
    title="Edit Role"
  >
    <b-col lg="6">
      <validation-observer
        #default="{ handleSubmit }"
        ref="refFormObserver"
      >
        <b-form
          @submit.prevent="handleSubmit(onSubmit)"
          @reset.prevent="resetForm"
        >
          <b-row>
            <b-col cols="12">
              <validation-provider
                #default="validationContext"
                name="Kode Role"
                rules="required"
              >
                <b-form-group
                  label="Kode Role"
                  label-for="h-role-code"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-role-code"
                    v-model="role_code"
                    autofocus
                    :state="getValidationState(validationContext)"
                    placeholder="Kode Role"
                  />
                  <b-form-invalid-feedback>
                    {{ validationContext.errors[0] }}
                  </b-form-invalid-feedback>
                </b-form-group>
              </validation-provider>
            </b-col>
            <b-col cols="12">
              <validation-provider
                #default="validationContext"
                name="Nama"
                rules="required"
              >
                <b-form-group
                  label="Nama"
                  label-for="h-name"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-name"
                    v-model="name"
                    :state="getValidationState(validationContext)"
                    placeholder="Nama"
                  />
                  <b-form-invalid-feedback>
                    {{ validationContext.errors[0] }}
                  </b-form-invalid-feedback>
                </b-form-group>
              </validation-provider>
            </b-col>
            <b-col cols="12">
              <validation-provider
                #default="validationContext"
                name="Deskripsi"
                rules="required"
              >
                <b-form-group
                  label="Deskripsi"
                  label-for="h-description"
                  label-cols-md="4"
                >
                  <b-form-textarea
                    id="h-description"
                    v-model="description"
                    :state="getValidationState(validationContext)"
                    placeholder="Deskripsi"
                  />
                  <b-form-invalid-feedback>
                    {{ validationContext.errors[0] }}
                  </b-form-invalid-feedback>
                </b-form-group>
              </validation-provider>
            </b-col>
            <b-col cols="12">
              <validation-provider
                #default="validationContext"
                name="Status"
                rules="required"
              >
                <b-form-group
                  label="Status"
                  label-for="h-status"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-status"
                    v-model="status"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="statusOp"
                    label="title"
                    placeholder="Pilih..."
                  />
                  <b-form-invalid-feedback :state="getValidationState(validationContext)">
                    {{ validationContext.errors[0] }}
                  </b-form-invalid-feedback>
                </b-form-group>
              </validation-provider>
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
                @click="redirectToRoleList()"
              >
                Kembali
              </b-button>
            </b-col>
          </b-row>

        </b-form>
      </validation-observer>
    </b-col>
  </b-card>
</template>

<script>
import {
  BCard, BRow, BCol, BFormGroup, BFormInput, BFormTextarea, BFormInvalidFeedback, BForm, BButton,
} from 'bootstrap-vue'
import Ripple from 'vue-ripple-directive'
import vSelect from 'vue-select'
import { ValidationProvider, ValidationObserver, extend } from 'vee-validate'
import { required, alphaNum } from '@validations'
import ToastificationContent from '@core/components/toastification/ToastificationContent.vue'
import statusOp from '@/@fake-db/data/other/status'
import yesNo from '@/@fake-db/data/other/yesNo'

extend('password', {
  params: ['target'],
  validate(value, { target }) {
    // console.log('Value : ', value)
    // console.log('Target : ', target)
    return value === target;
  },
  message: 'Konfirmasi kata sandi tidak cocok'
});

export default {
  components: {
    BCard,
    BRow,
    BCol,
    BFormGroup,
    BFormInput,
    BFormTextarea,
    BFormInvalidFeedback,
    BForm,
    BButton,
    vSelect,

    // Form Validation
    ValidationProvider,
    ValidationObserver,
  },
  directives: {
    Ripple,
  },
  data() {
    return {
      required,
      alphaNum,
      statusOp,
      yesNo,

      // Form Validation
      ValidationProvider,
      ValidationObserver,

      role_code: '',
      name: '',
      description: '',
      status: null,

      // userData: {
      //   user_code: '',
      //   full_name: '',
      //   password: '',
      //   branch_code: null,
      //   office_code: null,
      //   user_group: null,
      //   id_account: null,
      //   id_employee: null,
      //   multiple_login: null,
      //   company_id: null,
      //   status: 'Aktif',
      // }
    }
  },
  mounted() {
    this.role_code = this.role[0].role_code,
    this.name = this.role[0].name,
    this.description = this.role[0].description
    this.status = this.role[0].status
  },
  computed: {
    role() {
      return this.$store.getters['role/getsRoleById'];
    },
  },
  methods: {
    getValidationState({ dirty, validated, valid = null }) {
      return dirty || validated ? valid : null;
    },
    resetForm() {
      this.password_confirm = '',
      this.formData = {
        role_code: '',
        name: '',
        password: '',
        description: null,
        status: null,
      };
    },
    onSubmit() {
      const data = {
        role_code: this.role_code,
        name: this.name,
        password: this.password,
        description: this.description,
        status: this.status,
      };

      console.log(data)

      this.$store.dispatch('role/UPDATE_ROLE', data).then(() => {
        this.$router.push('/masterdata/roles-mapping')
        .then(() => {
          this.$toast({
            component: ToastificationContent,
            position: 'top-right',
            props: {
              title: `Berhasil edit role`,
              icon: 'ThumbsUpIcon',
              variant: 'success',
              text: `Anda telah berhasil mengubah role ${data.name}!`,
            },
          })
        })
      });
    },
    redirectToRoleList() {
      this.$router.push({ path: '/masterdata/roles-mapping' })
    },
  },
}
</script>

<style lang="scss">
@import '@core/scss/vue/libs/vue-select.scss';
</style>
