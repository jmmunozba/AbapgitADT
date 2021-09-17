CLASS zcl_wtc_money_machine DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_change,
      amount TYPE i,
      type   TYPE string,
    END OF ty_change.

    TYPES tt_change TYPE STANDARD TABLE OF ty_change
                    WITH DEFAULT KEY.

    METHODS constructor.
    METHODS get_amount_in_coins
      IMPORTING
        !i_amount      TYPE i
      RETURNING
        VALUE(r_coin_amount) TYPE i .
    METHODS get_amount_in_notes
      IMPORTING
        !i_amount      TYPE i
      RETURNING
        VALUE(r_notes_amount) TYPE i .
    METHODS get_change
      IMPORTING
        i_amount  TYPE i
      RETURNING
        VALUE(t_change) TYPE tt_change.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA t_ordered_amount TYPE tt_change.
ENDCLASS.



CLASS zcl_wtc_money_machine IMPLEMENTATION.

  METHOD constructor.
    t_ordered_amount = VALUE #(
        ( amount = 500  type = 'note' )
        ( amount = 200  type = 'note' )
        ( amount = 100  type = 'note' )
        ( amount = 50   type = 'note' )
        ( amount = 20   type = 'note' )
        ( amount = 10   type = 'note' )
        ( amount = 5    type = 'note' )
        ( amount = 2    type = 'coin' )
        ( amount = 1    type = 'coin' )
    ).
  ENDMETHOD.

  METHOD get_amount_in_coins.
    r_coin_amount = COND #( WHEN i_amount <= 0
                      THEN -1
                      ELSE i_amount MOD 5 ).
  ENDMETHOD.


  METHOD get_amount_in_notes.
    r_notes_amount = get_amount_in_coins( i_amount ).
    IF r_notes_amount >= 0.
      r_notes_amount = i_amount - r_notes_amount.
    ENDIF.
  ENDMETHOD.

  METHOD get_change.
*    DATA  r_notes_amount TYPE i.
*    DATA  s_change       TYPE ty_change.
*    DATA: lv_rest        TYPE i,
*          lv_note10      TYPE p DECIMALS 1.
*
*    r_notes_amount = get_amount_in_notes( i_amount ).
*
*    IF r_notes_amount <> -1.
*      lv_note10 = r_notes_amount / 10.
*      lv_rest = r_notes_amount MOD 10.
*
*      IF lv_note10 >= 1.
*        s_change-amount = FLOOR( lv_note10 ).
*        s_change-type = 'Diez'.
*
*        APPEND s_change TO t_change.
*      ENDIF.
*
*      IF lv_rest >= 5.
*        s_change-amount = 1.
*        s_change-type = 'Cinco'.
*
*        APPEND s_change TO t_change.
*      ENDIF.
*    ENDIF.
    DATA ls_ordered_amount TYPE LINE OF tt_change.

    DATA(v_resto) = i_amount.

    LOOP AT t_ordered_amount INTO ls_ordered_amount.
      WHILE ( v_resto >= ls_ordered_amount-amount ).
        v_resto = v_resto - ls_ordered_amount-amount.
        APPEND ls_ordered_amount TO t_change.
      ENDWHILE.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
