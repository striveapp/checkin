library app_config;

const int DEFAULT_CLASS_CAPACITY = 10;
const int TOTAL_MAT_TIME_WEEK = 7;
const int TOTAL_MAT_TIME_MONTH = 30;
const int TOTAL_MAT_TIME_YEAR = 300;

const TEST_STORAGE_BUCKET = 'gs://checkin-test-fba3d.appspot.com';
const STORAGE_BUCKET = 'gs://checkin-b7e8d.appspot.com';
const TEST_CLOUD_FUNCTIONS_DOMAIN = "https://admin-console-test-fba3d.firebaseapp.com";
const CLOUD_FUNCTIONS_DOMAIN = "https://admin-console-b7e8d.firebaseapp.com";

const DEFAULT_USER_IMAGE_URL =
    "https://firebasestorage.googleapis.com/v0/b/checkin-b7e8d.appspot.com/o/default_pic.png?alt=media&token=3028f80c-8009-478e-a631-ff9e39f1b48a";

//TODO: Is better to place this in the backend
const DEFAULT_GYM_IMAGE_URL =
    "https://firebasestorage.googleapis.com/v0/b/checkin-b7e8d.appspot.com/o/adaptive_icon.png?alt=media&token=3094b170-c21c-4940-9e61-6f3b14434752";
