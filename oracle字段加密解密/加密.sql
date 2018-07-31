create or replace function 
  encrypt_des(p_text varchar2, p_key varchar2) return varchar2 is
  v_text varchar2(4000);
  v_enc varchar2(4000);
  raw_input RAW(128) ;
  key_input RAW(128) ;
  decrypted_raw RAW(2048);
  begin
  v_text := rpad( p_text, (trunc(length(p_text)/8)+1)*8, chr(0));
  raw_input := UTL_RAW.CAST_TO_RAW(v_text);
  key_input := UTL_RAW.CAST_TO_RAW(p_key);
  dbms_obfuscation_toolkit.DESEncrypt(input => raw_input,key => key_input,encrypted_data =>decrypted_raw);
  v_enc := rawtohex(decrypted_raw);
  dbms_output.put_line(v_enc);
  return v_enc;
end;
