;; 입력 파일
;; D:\#.Secure Work Folder\BIG\Project\23~24Y\240129 CAD Reading Automation\DWG\in\240119 first\PL1-PD-0000~42_1_P&ID_Rev.01.dwg

;; 저장 위치
;; C:\Users\LG\Downloads\

(defun c:ExportAllLayoutsToPDF ()
 (vl-load-com) ; Visual LISP 함수를 로드합니다.
 (setq doc (vla-get-activedocument (vlax-get-acad-object))) ; 현재 문서를 가져옵니다.
 (setq layouts (vla-get-layouts doc)) ; 모든 레이아웃을 가져옵니다.
​
 (vlax-for layout layouts
   (if (not (wcmatch (vla-get-name layout) "Model")) ; "Model" 레이아웃을 제외합니다.
     (progn
       (setq layout-name (vla-get-name layout)) ; 레이아웃 이름을 가져옵니다.
       ;; (setq pdf-name (strcat "C:\\Users\\LG\\Downloads\\" layout-name "fish.pdf")) ; PDF 파일명을 설정합니다.
       (setq pdf-name (strcat "C:/Users/LG/Downloads/" layout-name "fish.pdf")) ; PDF 파일명을 설정합니다.
       
       ;; 레이아웃을 현재 레이아웃으로 설정합니다.
       (vla-put-activelayout doc layout)
​
       ;; 플롯 설정을 지정합니다.
       (vla-put-configname layout "DWG To PDF.pc3") ; PDF 프린터 설정을 선택합니다.
       (vla-put-paperunits layout acMillimeters) ; 용지 단위를 설정합니다.
       (vla-put-standardScale layout acScaleToFit) ; 축척을 설정합니다.
       (vla-put-centerplot layout :vlax-true) ; 중앙에 플롯팅합니다.
       (vla-put-plotrotation layout ac0degrees) ; 플롯 회전을 설정합니다.
       (vla-put-plottype layout acExtents) ; 플롯 유형을 설정합니다.
       (vla-put-usestandardScale layout :vlax-true) ; 표준 축척 사용을 설정합니다.
       (vla-put-canonicalmedianame layout "ISO_full_bleed_A3_(420.00_x_297.00_MM)") ; A3 용지 크기를 설정합니다.
​
       ;; PDF로 내보내기 위한 명령어 실행
       (command "-export" "PDF" "Y" "" pdf-name) ; PDF로 내보냅니다.
     )
   )
 )​
 (princ "\nAll layouts have been exported to A3 PDF.")
 (princ)
)
​​
