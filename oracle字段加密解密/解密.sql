create or replace function decrypt_des(p_text varchar2,p_key varchar2) return varchar2 is
  v_text varchar2(2000);
  begin
    dbms_obfuscation_toolkit.DESDECRYPT(input_string => UTL_RAW.CAST_TO_varchar2(p_text),key_string =>p_key, decrypted_string=> v_text);
    v_text := rtrim(v_text,chr(0));
    dbms_output.put_line(v_text);
  return v_text;
end;
