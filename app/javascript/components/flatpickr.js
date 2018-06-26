import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";
import "flatpickr/dist/themes/material_blue.css";

flatpickr(".flatpickr", {
  altInput: true,
  altFormat: "l, F j, Y",
  dateFormat: "Y-m-d",
  minDate: "today",
  weekNumbers: true
});
