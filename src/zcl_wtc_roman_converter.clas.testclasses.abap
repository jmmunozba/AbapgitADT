*"* use this source file for your ABAP unit test classes
CLASS lt_roman_to_arabic DEFINITION FOR TESTING
  RISK LEVEL HARMLESS
  DURATION SHORT.

  PRIVATE SECTION.
    DATA: m_cut TYPE REF TO zcl_wtc_roman_converter.
    METHODS one_in_1_out FOR TESTING.
    METHODS two_in_2_out FOR TESTING.
    METHODS three_in_3_out FOR TESTING.
    METHODS four_in_4_out FOR TESTING RAISING cx_static_check.
    METHODS five_in_5_out FOR TESTING RAISING cx_static_check.
    METHODS six_in_6_out FOR TESTING RAISING cx_static_check.
    METHODS seven_in_7_out FOR TESTING RAISING cx_static_check.
    METHODS eight_in_8_out FOR TESTING RAISING cx_static_check.
    METHODS nine_in_9_out FOR TESTING RAISING cx_static_check.
    METHODS ten_in_10_out FOR TESTING RAISING cx_static_check.
    METHODS fifty_in_50_out FOR TESTING RAISING cx_static_check.
    METHODS hundred_in_100_out FOR TESTING RAISING cx_static_check.
    METHODS five_hundred_in_500_out FOR TESTING RAISING cx_static_check.
    METHODS thousand_in_1000_out FOR TESTING RAISING cx_static_check.
    METHODS custom_in_custom_out FOR TESTING RAISING cx_static_check.
    METHODS setup.

ENDCLASS.

CLASS lt_roman_to_arabic IMPLEMENTATION.

  METHOD setup.
    "Given
    m_cut = NEW zcl_wtc_roman_converter( ).
  ENDMETHOD.

  METHOD one_in_1_out.
    "When
    DATA(arabic) = m_cut->to_arabic( i_roman_numeral = 'I' ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING act = arabic
                                                  exp = 1 ).
  ENDMETHOD.

   METHOD two_in_2_out.
    "When
    DATA(arabic) = m_cut->to_arabic( i_roman_numeral = 'II' ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING act = arabic
                                                  exp = 2 ).
  ENDMETHOD.

  METHOD three_in_3_out.
    "When
    DATA(arabic) = m_cut->to_arabic( i_roman_numeral = 'III' ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING act = arabic
                                                  exp = 3 ).
  ENDMETHOD.

  METHOD four_in_4_out.
    "When
    DATA(arabic) = m_cut->to_arabic( i_roman_numeral = 'IV' ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING act = arabic
                                                  exp = 4 ).
  ENDMETHOD.

  METHOD five_in_5_out.
    "When
    DATA(arabic) = m_cut->to_arabic( i_roman_numeral = 'V' ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING act = arabic
                                                  exp = 5 ).
  ENDMETHOD.

  METHOD six_in_6_out.
    "When
    DATA(arabic) = m_cut->to_arabic( i_roman_numeral = 'VI' ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING act = arabic
                                                  exp = 6 ).
  ENDMETHOD.

  METHOD seven_in_7_out.
    "When
    DATA(arabic) = m_cut->to_arabic( i_roman_numeral = 'VII' ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING act = arabic
                                                  exp = 7 ).
  ENDMETHOD.

  METHOD eight_in_8_out.
    "When
    DATA(arabic) = m_cut->to_arabic( i_roman_numeral = 'VIII' ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING act = arabic
                                                  exp = 8 ).
  ENDMETHOD.

  METHOD nine_in_9_out.
    "When
    DATA(arabic) = m_cut->to_arabic( i_roman_numeral = 'IX' ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING act = arabic
                                                  exp = 9 ).
  ENDMETHOD.

  METHOD ten_in_10_out.
    "When
    DATA(arabic) = m_cut->to_arabic( i_roman_numeral = 'X' ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING act = arabic
                                                  exp = 10 ).
  ENDMETHOD.


  METHOD fifty_in_50_out.
    "When
    DATA(arabic) = m_cut->to_arabic( i_roman_numeral = 'L' ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING act = arabic
                                                  exp = 50 ).
  ENDMETHOD.

  METHOD hundred_in_100_out.
    "When
    DATA(arabic) = m_cut->to_arabic( i_roman_numeral = 'C' ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING act = arabic
                                                  exp = 100 ).
  ENDMETHOD.

  METHOD five_hundred_in_500_out.
    "When
    DATA(arabic) = m_cut->to_arabic( i_roman_numeral = 'D' ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING act = arabic
                                                  exp = 500 ).
  ENDMETHOD.

  METHOD thousand_in_1000_out.
    "When
    DATA(arabic) = m_cut->to_arabic( i_roman_numeral = 'M' ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING act = arabic
                                                  exp = 1000 ).
  ENDMETHOD.

  METHOD custom_in_custom_out.
    "When
    DATA(arabic) = m_cut->to_arabic( i_roman_numeral = 'MCMLXXIII' ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING act = arabic
                                                  exp = 1973 ).
  ENDMETHOD.

ENDCLASS.
