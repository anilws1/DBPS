BEGIN
    FOR
        l_counter IN
        1 ..
        5 LOOP
        DBMS_OUTPUT.PUT_LINE (l_counter);
    END LOOP;
END;