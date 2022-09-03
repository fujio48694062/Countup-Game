VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Sheet1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Option Explicit

Dim g As Integer
Dim r As Integer
Dim n As Integer
Dim i As Integer
Dim StartTimer As Double
Dim StopFlg As Boolean


Private Sub Worksheet_BeforeRightClick(ByVal Target As Range, Cancel As Boolean)
  
  '�E�N���b�N�̃��j���[�\���𖳌�'
  Cancel = True
  
  'Start�Z�����E�N���b�N�����ꍇ'
  If Target.Value = Cells(10, 2) Then
    g = Int((8 - 2 + 1) * Rnd + 2) '�s���������_���ɑI���i2�`8�j'
    r = Int((6 - 2 + 1) * Rnd + 2) '�񐔂������_���ɑI���iB�`F�j'
    Cells(g, r) = 1

    '�^�C�}�['
    StartTimer = Timer
    StopFlg = False
    Do While StopFlg = False '�^�C�}�[�X�^�[�g'
      Cells(10, 5) = Int((Timer - StartTimer) * 100) / 100
      'Cells(10, 5) = Application.WorksheetFunction.RoundDown(Int((Timer - StartTimer) * 100) / 100, 2) '�����_2���ȉ��؂�̂�'
      DoEvents
    Loop
  End If

  '�Ֆʂ��E�N���b�N�����ꍇ'
  If Target.Value = "" Then
    MsgBox ("�͂���")
  
  '1�`4�̐��l��I�������ꍇ'
  ElseIf Target.Value = "1" Or _
         Target.Value = "2" Or _
         Target.Value = "3" Or _
         Target.Value = "4" Then
    n = Target.Value 'n = 1�`4'
    g = Int((8 - 2 + 1) * Rnd + 2) '�s���������_���ɑI���i2�`8�j'
    r = Int((6 - 2 + 1) * Rnd + 2) '�񐔂������_���ɑI���iB�`F�j'
    If Cells(g, r) = "" Then
      Cells(g, r) = n + 1 'n = 2�`5'
    Else '���̐������\�������Z�����O�̐����Ɠ����������ꍇ'
      Cells(g, r + 1) = n + 1 'n = 2�`5' '�E�ׂ̃Z���ɕ\��'
    End If
    Target.Value = "" '���l���������Z�����폜'
  
  '5�̐��l��I�������ꍇ�i�Q�[���N���A�j'
  ElseIf Target.Value = "5" Then
    StopFlg = True '�^�C�}�[�X�g�b�v�iLoop�I���j'
    MsgBox ("���߂łƂ��Q�[���I���ł�")
    Range("B2:F8") = "" '�Ֆʂ����Z�b�g'

    '�����L���O'
    Range("D13:D22") = "" '�O��̖����폜'
    For i = 13 To 23
      If Cells(i, "C") = "" Then
        Cells(i, "C") = Cells(10, 5).Value
        Cells(i, "D") = "��" '����̋L�^�ł��邱�Ƃ�����'
        Exit For
      End If
    Next i

    '���ёւ�'
    Call Range("C13:D23").Sort( _
      Key1:=Range("C13"), Order1:=xlAscending) '����'
    Cells(23, 3) = "" '11�ʂ��폜'
  End If
  
 'Reset�Z�����E�N���b�N�����ꍇ'
  If Target.Value = Cells(12, 4) Then
    Cells(10, 5).Value = "0.00�b" '�^�C�}�[�����Z�b�g'
    Range("C13:D22") = "" '�����L���O�����Z�b�g'
  End If

End Sub