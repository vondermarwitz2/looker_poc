include: "/autogenerated_views/receiving_advice.view.lkml"
include: "/refined_views/receiving_advice_all_r.view.lkml"

explore: +receiving_advice {
  hidden: yes
  fields: [receiving_advice.message_timestamp_raw,
    receiving_advice.recadv__delivery_note_number]
}
