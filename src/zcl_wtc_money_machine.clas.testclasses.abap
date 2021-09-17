*"* use this source file for your ABAP unit test classes
CLASS ltc_get_amount DEFINITION FOR TESTING
  RISK LEVEL harmless DURATION short.

  PRIVATE SECTION.
    DATA: m_cut TYPE REF TO zcl_wtc_money_machine.
    METHODS setup.
    METHODS amount_4_note_0 FOR TESTING RAISING cx_static_check.
    METHODS amount_29_note_25 FOR TESTING RAISING cx_static_check.
    METHODS get_change_for_amount_minus_11 FOR TESTING RAISING cx_static_check.
    METHODS get_change_for_amount_0 FOR TESTING RAISING cx_static_check.
    METHODS get_change_for_amount_5 FOR TESTING RAISING cx_static_check.
    METHODS get_change_for_amount_15 FOR TESTING RAISING cx_static_check.
    METHODS get_change_for_amount_437 FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_get_amount IMPLEMENTATION.

  METHOD setup.

    "Given
    m_cut = NEW zcl_wtc_money_machine( ).
  ENDMETHOD.

  METHOD amount_4_note_0.
    "When
    DATA(note_amount) = m_cut->get_amount_in_notes( i_amount = 4 ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING act = note_amount
                                                  exp = 0 ).
  ENDMETHOD.

  METHOD amount_29_note_25.
    "When
    DATA(note_amount) = m_cut->get_amount_in_notes( i_amount = 29 ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING act = note_amount
                                                  exp = 25 ).
  ENDMETHOD.

  METHOD get_change_for_amount_minus_11.
    cl_abap_unit_assert=>assert_initial( m_cut->get_change( -11 ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_0.
    cl_abap_unit_assert=>assert_initial( m_cut->get_change( 0 ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_5.
    cl_abap_unit_assert=>assert_equals( act = m_cut->get_change( 5 )
                                        exp = VALUE zcl_wtc_money_machine=>tt_change(
                                              ( amount = 5   type = 'note' ) ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_15.
    cl_abap_unit_assert=>assert_equals( act =  m_cut->get_change( i_amount = 15 )
                                        exp = VALUE zcl_wtc_money_machine=>tt_change(
                                              ( amount = 10  type = 'note'  )
                                              ( amount = 5   type = 'note' ) )  ).
  ENDMETHOD.

  METHOD get_change_for_amount_437.
    cl_abap_unit_assert=>assert_equals( act =  m_cut->get_change( i_amount = 437 )
                                        exp = VALUE zcl_wtc_money_machine=>tt_change(
                                              ( amount = 200 type = 'note' )
                                              ( amount = 200 type = 'note' )
                                              ( amount = 20  type = 'note' )
                                              ( amount = 10  type = 'note' )
                                              ( amount = 5   type = 'note' )
                                              ( amount = 2   type = 'coin' ) ) ).
  ENDMETHOD.

ENDCLASS.
