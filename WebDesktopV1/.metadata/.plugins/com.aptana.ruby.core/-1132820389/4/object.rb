class Object < BasicObject
  include Kernel

  ARGF = ARGF
  ARGV = []
  ArgumentError = ArgumentError
  Array = Array
  BasicObject = BasicObject
  Bignum = Bignum
  Binding = Binding
  CROSS_COMPILING = nil
  Class = Class
  Comparable = Comparable
  Complex = Complex
  Config = RbConfig
  Data = Data
  Date = Date
  DateTime = DateTime
  Dir = Dir
  ENV = {"ANDROID_SDK"=>"/opt/android-sdk-linux_x86/", "ANDROID_NDK"=>"/opt/android-ndk-r7b/", "XDG_SESSION_PATH"=>"/org/freedesktop/DisplayManager/Session0", "SHLVL"=>"1", "JAVA_HOME"=>"/opt/jdk1.7.0", "SSH_AGENT_PID"=>"2263", "XFILESEARCHPATH"=>"/usr/dt/app-defaults/%L/Dt", "SESSION_MANAGER"=>"local/laboratorio-virtual-machine:@/tmp/.ICE-unix/2387,unix/laboratorio-virtual-machine:/tmp/.ICE-unix/2387", "GDMSESSION"=>"kde-plasma", "XDG_SESSION_COOKIE"=>"84e83fa3b68dcf5826aa919c50836550-1352648208.607459-2029148859", "XDG_DATA_DIRS"=>"/usr/share/kde-plasma:/usr/local/share/:/usr/share/", "MANDATORY_PATH"=>"/usr/share/gconf/kde-plasma.mandatory.path", "PWD"=>"/home/laboratorio/Documentos", "XCURSOR_THEME"=>"default", "LOGNAME"=>"laboratorio", "QT_PLUGIN_PATH"=>"/home/laboratorio/.kde/lib/kde4/plugins/:/usr/lib/kde4/plugins/", "KDE_SESSION_VERSION"=>"4", "NLSPATH"=>"/usr/dt/lib/nls/msg/%L/%N.cat", "SSH_AUTH_SOCK"=>"/tmp/ssh-9oCBmBfzGCjZ/agent.2230", "GS_LIB"=>"/home/laboratorio/.fonts", "LD_LIBRARY_PATH"=>"/opt/jdk1.7.0/jre/lib/i386/client:/opt/jdk1.7.0/jre/lib/i386:", "KDE_MULTIHEAD"=>"false", "SHELL"=>"/bin/bash", "DBUS_SESSION_BUS_ADDRESS"=>"unix:abstract=/tmp/dbus-8nzK3N67WE,guid=ea348618ba577bbbbaed4bc7509fc611", "LANGUAGE"=>"es_VE:es", "GTK2_RC_FILES"=>"/etc/gtk-2.0/gtkrc:/home/laboratorio/.gtkrc-2.0:/home/laboratorio/.kde/share/config/gtkrc-2.0", "GTK_RC_FILES"=>"/etc/gtk/gtkrc:/home/laboratorio/.gtkrc:/home/laboratorio/.kde/share/config/gtkrc", "CLASSPATH"=>"/opt/jdk1.7.0/jre/lib/rt.jar:/opt/jdk1.7.0/lib/tools.jar:/opt/jdk1.7.0/lib/dt.jar", "XDG_CONFIG_DIRS"=>"/etc/xdg/xdg-kde-plasma:/etc/xdg", "PATH"=>"/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/android-sdk-linux_x86/platforms:/opt/android-sdk-linux_x86/platform-tools:/opt/android-sdk-linux_x86/tools:/opt/jdk1.7.0/bin:/opt/android-sdk-linux_x86/platforms:/opt/android-sdk-linux_x86/platform-tools:/opt/android-sdk-linux_x86/tools:/opt/jdk1.7.0/bin", "KDE_SESSION_UID"=>"1000", "DESKTOP_SESSION"=>"kde-plasma", "APTANA_VERSION"=>"3.2.2.1343263605", "KDE_FULL_SESSION"=>"true", "DISPLAY"=>":0", "UBUNTU_MENUPROXY"=>"libappmenu.so", "USER"=>"laboratorio", "HOME"=>"/home/laboratorio", "XAUTHORITY"=>"/tmp/kde-laboratorio/xauth-1000-_0", "DEFAULTS_PATH"=>"/usr/share/gconf/kde-plasma.default.path", "XDG_SEAT_PATH"=>"/org/freedesktop/DisplayManager/Seat0", "XDG_RUNTIME_DIR"=>"/run/user/laboratorio", "LANG"=>"es_VE.UTF-8"}
  EOFError = EOFError
  Encoding = Encoding
  EncodingError = EncodingError
  Enumerable = Enumerable
  Enumerator = Enumerator
  Errno = Errno
  Etc = Etc
  Exception = Exception
  FALSE = false
  FalseClass = FalseClass
  Fiber = Fiber
  FiberError = FiberError
  File = File
  FileTest = FileTest
  FileUtils = FileUtils
  Fixnum = Fixnum
  Float = Float
  FloatDomainError = FloatDomainError
  GC = GC
  Gem = Gem
  Hash = Hash
  IO = IO
  IOError = IOError
  IndexError = IndexError
  Integer = Integer
  Interrupt = Interrupt
  Kernel = Kernel
  KeyError = KeyError
  LoadError = LoadError
  LocalJumpError = LocalJumpError
  Marshal = Marshal
  MatchData = MatchData
  Math = Math
  Method = Method
  Module = Module
  Mutex = Mutex
  NIL = nil
  NameError = NameError
  NilClass = NilClass
  NoMemoryError = NoMemoryError
  NoMethodError = NoMethodError
  NotImplementedError = NotImplementedError
  Numeric = Numeric
  OUTPUT_PATH = "/home/laboratorio/Documents/Aptana Studio 3 Workspace/.metadata/.plugins/com.aptana.ruby.core/-1132820389/4/"
  Object = Object
  ObjectSpace = ObjectSpace
  Proc = Proc
  Process = Process
  Psych = Psych
  RUBY_COPYRIGHT = "ruby - Copyright (C) 1993-2012 Yukihiro Matsumoto"
  RUBY_DESCRIPTION = "ruby 1.9.3p194 (2012-04-20 revision 35410) [i686-linux]"
  RUBY_ENGINE = "ruby"
  RUBY_PATCHLEVEL = 194
  RUBY_PLATFORM = "i686-linux"
  RUBY_RELEASE_DATE = "2012-04-20"
  RUBY_REVISION = 35410
  RUBY_VERSION = "1.9.3"
  Random = Random
  Range = Range
  RangeError = RangeError
  Rational = Rational
  RbConfig = RbConfig
  Regexp = Regexp
  RegexpError = RegexpError
  RubyVM = RubyVM
  RuntimeError = RuntimeError
  STDERR = IO.new
  STDIN = IO.new
  STDOUT = IO.new
  ScanError = StringScanner::Error
  ScriptError = ScriptError
  SecurityError = SecurityError
  Signal = Signal
  SignalException = SignalException
  StandardError = StandardError
  StopIteration = StopIteration
  String = String
  StringIO = StringIO
  StringScanner = StringScanner
  Struct = Struct
  Syck = Syck
  Symbol = Symbol
  SyntaxError = SyntaxError
  SystemCallError = SystemCallError
  SystemExit = SystemExit
  SystemStackError = SystemStackError
  TOPLEVEL_BINDING = #<Binding:0x99aa00c>
  TRUE = true
  TSort = TSort
  Thread = Thread
  ThreadError = ThreadError
  ThreadGroup = ThreadGroup
  Time = Time
  TrueClass = TrueClass
  TypeError = TypeError
  URI = URI
  UnboundMethod = UnboundMethod
  YAML = Psych
  ZeroDivisionError = ZeroDivisionError
  Zlib = Zlib

  def self.yaml_tag(arg0)
  end


  def psych_to_yaml(arg0, arg1, *rest)
  end

  def to_yaml(arg0, arg1, *rest)
  end

  def to_yaml_properties
  end


  protected


  private

  def dir_names(arg0)
  end

  def file_name(arg0)
  end

  def get_classes
  end

  def grab_instance_method(arg0, arg1)
  end

  def print_args(arg0)
  end

  def print_instance_method(arg0, arg1)
  end

  def print_method(arg0, arg1, arg2, arg3, arg4, *rest)
  end

  def print_type(arg0)
  end

  def print_value(arg0)
  end

end
