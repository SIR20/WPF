unit MouseEventsWPF;

interface

uses WPFObjects;

type
  Events = class
  private
    OList := new List<PictureWPF>;
  public
    event MouseDown, MouseUp, MouseEnter, MouseNEnter, DoubleClick: procedure(o: PictureWPF);
    
    constructor Create(params a: array of PictureWPF) := a.ForEach(i -> begin OList.Add(i) end);
    
    procedure InitMouseDown;
    begin
      OnMouseDown += (x, y, mb, e)-> begin
        var o: PictureWPF;
        try
          o := PictureWPF(ObjectUnderPoint(x, y));
          if o in OList then 
            MouseDown(o);
        except
        end;
      end;
    end;
    
    procedure InitDoubleClick;
    begin
      OnMouseDown += (x, y, mb, с)-> begin
        var o: PictureWPF;
        try
          o := PictureWPF(ObjectUnderPoint(x, y));
          if (o in OList) and (с = 2) then 
            DoubleClick(o);
        except
        end;
      end;
    end;
    
    procedure InitMouseUp;
    begin
      OnMouseUp += (x, y, mb)-> begin
        var o: PictureWPF;
        try
          o := PictureWPF(ObjectUnderPoint(x, y));
          if (o in OList) then MouseUp(o);
        except
        end;
      end;
    end;
    
    procedure InitMouseEnter;
    begin
      OnMouseMove += (x, y, mb)-> begin
        var o: PictureWPF;
        try
          o := PictureWPF(ObjectUnderPoint(x, y));
          if (o in OList) then MouseEnter(o);
        except
        end;
      end;
    end;
    
    procedure InitMouseNEnter;
    begin
      OnMouseMove += (x, y, mb)-> begin
        var o: PictureWPF;
        try
          o := PictureWPF(ObjectUnderPoint(x, y));
          if not (o in OList) then MouseNEnter(o);
        except
        end;
      end;
    end;
  
  end;
  
  OEvents = class
  private
    OList := new List<ObjectWPF>;
  public
    event MouseDown, MouseUp, MouseEnter, MouseNEnter, DoubleClick: procedure(o: ObjectWPF);
    
    constructor Create(params a: array of ObjectWPF) := a.ForEach(i -> begin OList.Add(i) end);
    
    procedure InitMouseDown;
    begin
      OnMouseDown += (x, y, mb, e)-> begin
        var  o := ObjectUnderPoint(x, y);
        if o in OList then 
          MouseDown(o);
      end;
    end;
    
    procedure InitDoubleClick;
    begin
      OnMouseDown += (x, y, mb, с)-> begin
        var o := ObjectUnderPoint(x, y);
        if (o in OList) and (с = 2) then 
          DoubleClick(o);
      end;
    end;
    
    procedure InitMouseUp;
    begin
      OnMouseUp += (x, y, mb)-> begin
        var  o := ObjectUnderPoint(x, y);
        if (o in OList) then MouseUp(o);
      end;
    end;
    
    procedure InitMouseEnter;
    begin
      OnMouseMove += (x, y, mb)-> begin
        var  o := ObjectUnderPoint(x, y);
        if (o in OList) then MouseEnter(o);
      end;
    end;
    
    procedure InitMouseNEnter;
    begin
      OnMouseMove += (x, y, mb)-> begin
        var  o := ObjectUnderPoint(x, y);
        if (o in OList) then MouseNEnter(o);
      end;
    end;
  
  end;

implementation

begin

end. 