unit langdef;

{para cambiar la definici�n del lenguaje, deben cambiarse estas cadenas (preferentemente
generando un recurso para el idioma apropiado) y modificarse uPSUtils.
En uPSUtils se encuentra la definici�n de las palabras reservadas y el procesador que
interpreta cada porci�n del scrip para encontrar las palabras reservadas, operadores
y dem�s elementos sint�cticos.}

interface

uses uPSCompiler, uPSUtils;

const
  CC_quote = #34;
  CI_ARRAY_START = 1; //sub�ndice inicial de los arreglos

{$IFDEF DELPHI3UP }
resourceString
{$ELSE }
const
{$ENDIF }
  {tipos de datos}
  CS_ansiString = 'cadena_ansi';
  CS_anyString = 'cualquier_cadena';
  CS_boolean = 'logico';
  CS_byte = 'byte';
  CS_cardinal = 'ordinal';
  CS_char = 'caracter';
  CS_class = 'clase';
  CS_currency = 'moneda';
  CS_double = 'real';
  CS_EMenuError = 'EErrorDeMenu';
  CS_Exception = 'Excepcion';
  CS_extended = 'real_largo';
  CS_float = 'real_corto';
  CS_HWND = 'Identificador';
  CS_IDispatch = 'IDespachador';
  CS_IInterface = 'IInterface';
  CS_int64 = 'entero_largo';
  CS_integer = 'entero';
  CS_IUnknown = 'IDesconocida';
  CS_list = 'lista';
  CS_longbool = 'logico_largo';
  CS_longInt = 'entero_largo';
  CS_longWord = 'ordinal';
  CS_nativeString = 'cadena_nativa';
  CS_OpenArray = 'arreglo_abierto';
  CS_pchar = 'caracteres';
  CS_Pointer = 'Puntero';
  CS_ProcPtr = 'PtrAProc';
  CS_real = 'real';
  CS_record = 'estructura';
  CS_ResourcePointer = 'PunteroARecurso';
  CS_single = CS_float;
  CS_shortint = 'entero_minimo';
  CS_smallint = 'entero_corto';
  CS_StaticArray = 'ArregloEstatico';
  CS_string = 'cadena';
  CS_TActionLink = 'TEnlaceAccion';
  CS_TADTField = 'TCampoADT';
  CS_TAdvancedMenuDrawItemEvent = 'TEventoDibujoAvanzadoElementoMenu';
  CS_TAlign = 'TAlineamiento';
  CS_TAlignment = 'TAlineacion';
  CS_TAnchorKind = 'TTipoAnclaje';
  CS_TAnchors = 'TAnclajes';
  CS_TApplication = 'TPrograma';
  CS_TArrayField = 'TCampoArreglo';
  CS_TAutoIncField = 'TCampoAutoincremental';
  CS_TAutoRefreshFlag = 'TBanderaRefrescoAutomatico';
  CS_TBasicAction = 'TAccionBasica';
  CS_TBCDField = 'TCampoDecimalCodificadoEnBinario';
  CS_TBevel = 'TDesnivel';
  CS_TBevelShape = 'TFormaDesnivel';
  CS_TBevelStyle = 'TEstiloDesnivel';
  CS_TBevelWidth = 'TAnchoDesnivel';
  CS_TBiDiMode = 'TModoBiDi';
  CS_TBinaryField = 'TCampoBinario';
  CS_TBitBtn = 'TBotonConImagen';
  CS_TBitBtnKind = 'TTipoDeBotonConImagen';
  CS_TBitmap = 'TMapaDeBits';
  CS_TBits = 'TBits';
  CS_TBlobData = 'TDatosBlob';
  CS_TBlobField = 'TCampoBlob';
  CS_TBlobStreamMode = 'TModoFlujoBlob';
  CS_TBlobType = 'TTipoBlob';
  CS_TBooleanField = 'TCampoLogico';
  CS_TBorderIcons = 'TIconosDePantalla';
  CS_TBorderIcon = 'TIconoDePantalla';
  CS_TBorderStyle = 'TEstiloDeBorde';
  CS_TBorderWidth = 'TAnchoDeBorde';
  CS_TBrush = 'TBrocha';
  CS_TBrushStyle = 'TEstiloBrocha';
  CS_tbtString = 'cadena_tbt';
  CS_TButton = 'TBoton';
  CS_TButtonControl = 'TControlDeBoton';
  CS_TButtonLayout = 'TDistribucionDeBoton';
  CS_TButtonState = 'TEstadoDeBoton';
  CS_TButtonStyle = 'TEstiloDeBoton';
  CS_TBytesField = 'TCampoBytes';
  CS_TCanvas = 'TLienzo';
  CS_TCheckbox = 'TCasillaVerificacion';
  CS_TCheckboxState = 'TEstadoCasillaVerificacion';
  CS_TCloseAction = 'TAccionDeCierre';
  CS_TCloseEvent = 'TEventoDeCierre';
  CS_TCloseQueryEvent = 'TEventoDeAceptarCierre';
  CS_TCMenuItem = 'TElementoMenuC';
  CS_TCollection = 'TColeccion';
  CS_TCollectionItem = 'TElementoColeccion';
  CS_TCollectionItemClass = 'TClaseElementoColeccion';
  CS_TColor = 'TColor';
  CS_TComboBox = 'TCampoDesplegable';
  CS_TComboBoxStyle = 'TEstiloCampoDesplegable';
  CS_TComponent = 'TComponente';
  CS_TComponentState = 'TEstadoComponente';
  CS_TComponentStateE = 'TEstadoComponenteExtendido';
  CS_TControl = 'TControl';
  CS_TControlScrollbar = 'TBarraDesplazamientoControl';
  CS_TCurrencyField = 'TCampoMoneda';
  CS_TCursor = 'TCursor';
  CS_TCustomCheckBox = 'TCasillaVerificacionParticular';
  CS_TCustomComboBox = 'TCampoDesplegableParticular';
  CS_TCustomControl = 'TControlParticular';
  CS_TCustomEdit = 'TCampoDeEdicionParticular';
  CS_TCustomGroupBox = 'TGrupoParticular';
  CS_TCustomImageList = 'TListaImagenesParticular';
  CS_TCustomLabel = 'TRotuloParticular';
  CS_TCustomListBox = 'TCampoListaParticular';
  CS_TCustomMemo = 'TCampoMultilineaParticular';
  CS_TCustomMemoryStream = 'TFlujoEnMemoriaParticular';
  CS_TCustomPanel = 'TPanelParticular';
  CS_TCustomRadioGroup = 'TGrupoSeleccionParticular';
  CS_TDataAction = 'TAccionDatos';
  CS_TDataLink = 'TEnlaceDeDatos';
  CS_TDataOperation = 'TOperacionDatos';
  CS_TDataSet = 'TConjuntoDeDatos';
  CS_TDataSetDesigner = 'TDise�adorConjuntoDeDatos';
  CS_TDataSetErrorEvent = 'TEventoErrorConjuntoDeDatos';
  CS_TDAtaSetField = 'TCampoConjuntoDeDatos';
  CS_TDataSetNotifyEvent = 'TEventoNotificacionConjuntoDeDatos';
  CS_TDataSetState = 'TEstadoConjuntoDeDatos';
  CS_TDataSource = 'TFuenteDeDatos';
  CS_TDateField = 'TCampoFecha';
  CS_TDateTime = 'FechaYHora';
  CS_TDateTimeField = 'TCampoFechaYHora';
  CS_TDefCollection = 'TColeccionDefiniciones';
  CS_TDefUpdateMethod = 'TMetodoActualizacionPorOmision';
  CS_TDragDropEvent = 'TEventoDeArrastrarYSoltar';
  CS_TDragKind = 'TTipoArrastre';
  CS_TDragMode = 'TModoDeArrastre';
  CS_TDragObject = 'TObjetoArrastrable';
  CS_TDragOverEvent = 'TEventoDeArrastrarPorEncima';
  CS_TDragState = 'TEstadoDeArrastre';
  CS_TDrawItemEvent = 'TEventoDeDibujadoDeElemento';
  CS_TDuplicates = 'TDuplicados';
  CS_TEdit = 'TCampoDeEdicion';
  CS_TEditCharcase = 'TEstiloDeTexto';
  CS_TEditMask = 'TMascaraEdicion';
  CS_TEndDragEvent = 'TEventoDeFinalizarArrastre';
  CS_TEOwnerDrawState = 'TEstadoDibujadoParticularExtendido';
  CS_TEShiftState = 'TEstadoMayusculasExtendido';
  CS_TField = 'TCampo';
  CS_TFieldAttributes = 'TAtributosCampo';
  CS_TFieldChars = 'TCaracteresCampo';
  CS_TFieldClass = 'TClaseCampo';
  CS_TFieldDefList = 'TListaDefinicionCampos';
  CS_TFieldDef = 'TDefinicionCampo';
  CS_TFieldDefs = 'TDefinicionCampos';
  CS_TFieldGetTExtEvent = 'TEventoObtenerTextoCampo';
  CS_TFieldKind = 'TTipoCampo';
  CS_TFieldKinds = 'TTiposCampos';
  CS_TFieldList = 'TListaCampos';
  CS_TFieldNotifyEvent = 'TEventoNotificacionCampo';
  CS_TfieldSetTextEvent = 'TEventoEstablecerTextoCampo';
  CS_TFields = 'TCampos';
  CS_TFieldType = 'TTipoCampo';
  CS_TFileStream = 'TFlujoDeArchivo';
  CS_TFilterOptions = 'TOpcionesFiltrado';
  CS_TFilterRecordEvent = 'TEventoFiltradoRegistro';
  CS_TFindItemKind = 'TTipoBusquedaElemento';
  CS_TFlatList = 'TListaPlana';
  CS_TFloatField = 'TCampoReal';
  CS_TFont = 'TFuente';
  CS_TFontPitch = 'TAnchoRelativoFuente';
  CS_TFontStyle = 'TEstiloFuente';
  CS_TFontStyles = 'TEstilosFuente';
  CS_TForm = 'TPantalla';
  CS_TFormBorderStyle = 'TEstiloBordePantalla';
  CS_TFormStyle = 'TEstiloPantalla';
  CS_TGetStrProc = 'TProcedimientoObtenerCadena';
  CS_TGraphic = 'TGrafico';
  CS_TGraphicControl = 'TControlGrafico';
  CS_TGraphicField = 'TCampoGrafico';
  CS_TGraphicsObject = 'TObjetoGrafico';
  CS_TGroupBox = 'TGrupo';
  CS_TGUIDField = 'TCampoGUID';
  CS_THandle = 'TIdentificador';
  CS_THandleStream = 'TIdentificadorFlujo';
  CS_THeader = 'TCabecera';
  CS_THelpContext = 'TAyudaDeContexto';
  CS_THelpEvent = 'TEventoDeAyuda';
  CS_TIcon = 'TIcono';
  CS_TIdleEvent = 'TEventoInactividad';
  CS_TIFException = 'TIFException';
  CS_TImage = 'TImagen';
  CS_TImageIndex = 'TIndiceImagen';
  CS_TImageList = 'TListaImagenes';
  CS_TindexDef = 'TDefinicionIndice';
  CS_TIndexDefs = 'TDefinicionesIndices';
  CS_TIndexOptions = 'TOpcionesIndice';
  CS_TintegerField = 'TCampoEntero';
  CS_TKeyEvent = 'TEventoDeTeclado';
  CS_TKeyPressEvent = 'TEventoDeTecleo';
  CS_TLabel = 'TRotulo';
  CS_TLargeIntField = 'TCampoEnteroLargo';
  CS_TList = 'TLista';
  CS_TListBox = 'TCampoLista';
  CS_TListBoxStyle = 'TEstiloCampoLista';
  CS_TLocateOption = 'TOpcionLocalizacion';
  CS_TLocateOptions = 'TOpcionesLocalizacion';
  CS_TLookupList = 'TListaRevision';
  CS_TMainMenu = 'TMenuPrincipal';
  CS_TMeasureItemEvent = 'TEventoDeMedicionDeElemento';
  CS_TMemo = 'TCampoEdicionMultilinea';
  CS_TMemoField = 'TCampoBlobMultilinea';
  CS_TMemoryStream = 'TFlujoEnMemoria';
  CS_TMenu = 'TMenu';
  CS_TMenuActionLink = 'TEnlaceAccionMenu';
  CS_TMenuAnimation = 'TAnimacionMenu';
  CS_TMenuAnimations = 'TAnimacionesMenu';
  CS_TMenuAutoFlag = 'TBanderaAutomatismosMenu';
  CS_TMenuBreak = 'TCorteMenu';
  CS_TMenuChangeEvent = 'TEventoCambioMenu';
  CS_TMenuDrawItemEvent = 'TEventoDibujarElementoMenu';
  CS_TMenuItem = 'TElementoDeMenu';
  CS_TMenuItemAutoFlag = 'TBanderaAutomatismoElementoMenu';
  CS_TMenuItemStack = 'TPilaDeElementoDeMenu';
  CS_TMenuMeasureItemEvent = 'TEventoDimensionarElementoMenu';
  CS_TModalResult = 'TResultadoMostrarYEsperar';
  CS_TMouseButton = 'TBotonDeRaton';
  CS_TMouseEvent = 'TEventoDeRaton';
  CS_TMouseMoveEvent = 'TEventoDeMovimientoDeRaton';
  CS_TNamedItem = 'TElementoNomenclado';
  CS_TNotebook = 'TLibroDeNotas';
  CS_TNotifyEvent = 'TEventoDeNotificacion';
  CS_TNumericField = 'TCampoNumerico';
  CS_Tobject = 'TObjeto';
  CS_TObjectField = 'TCampoObjeto';
  CS_TOleFormObject = 'TPantallaOle';
  CS_TOperation = 'TOperacion';
  CS_TOwnedCollection = 'TCollectionApropiada';
  CS_TOwnerDrawState = 'TEstadoDibujadoParticular';
  CS_TPaintBox = 'TCuadroDeDibujo';
  CS_TPage = 'TPagina';
  CS_TPanel = 'TPanel';
  CS_TPanelBevel = 'TDesnivelPanel';
  CS_TParam = 'TParametro';
  CS_TParams = 'TParametros';
  CS_TParamType = 'TTipoParametro';
  CS_TParser = 'TInterpretador';
  CS_TPen = 'TLapiz';
  CS_TPenMode = 'TModoLapiz';
  CS_TPenStyle = 'TEstiloLapiz';
  CS_TPersistent = 'TPersistente';
  CS_TPicture = 'TPintura';
  CS_TPoint = 'TPunto';
  CS_TPopUpAlignment = 'TAlineacionEmergentes';
  CS_TPopUpList = 'TListaDeEmergentes';
  CS_TPopUpMenu = 'TMenuEmergente';
  CS_TPosition = 'TPosicion';
  CS_TPrintScale = 'TEscalaImpresion';
  CS_TProviderFlags = 'TBanderasProveedor';
  CS_TRadioButton = 'TBotonSeleccion';
  CS_TRadioGroup = 'TGrupoSeleccion';
  CS_TRect = 'TRectangulo';
  CS_TReferenceField = 'TCampoReferencia';
  CS_TResourceStream = 'TFlujoDeRecurso';
  CS_TScrollBar = 'TBarraDesplazamiento';
  CS_TScrollBarInc = 'TIncrementoBarraDesplazamiento';
  CS_TScrollBarKind = 'TTipoBarraDesplazamiento';
  CS_TScrollBox = 'TCajaDesplazable';
  CS_TScrollCode = 'TCodigoBarraDesplazamiento';
  CS_TScrollEvent = 'TEventoDeBarraDesplazamiento';
  CS_TScrollingWinControl = 'TControlDePantallaDesplazable';
  CS_TScrollStyle = 'TEstiloBarraDesplazamiento';
  CS_TSectionEvent = 'TEventoDeSeccion';
  CS_TShape = 'TFigura';
  CS_TShapeType = 'TTipoFigura';
  CS_TShiftState = 'TEstadoMayusculas';
  CS_TShortCut = 'TAtajo';
  CS_TSmallIntField = 'TCampoEnteroPeque�o';
  CS_TSpeedButton = 'TBotonRapido';
  CS_TStack = 'TPila';
  CS_TStartDragEvent = 'TEventoDeIniciarArrastre';
  CS_TStream = 'TFlujo';
  CS_TStringField = 'TCampoCadena';
  CS_TStringList = 'TListaCadenas';
  CS_TStrings = 'TCadenas';
  CS_TTextLayout = 'TDisposicionDeTexto';
  CS_TTileMode = 'TModoEnMosaico';
  CS_TTimeField = 'TCampoHora';
  CS_TTimer = 'TTemporizador';
  CS_TTrackButton = 'TBotonDeSeguimiento';
  CS_TUpdateStatus = 'TEstadoActualizacion';
  CS_TUpdateStatusSet = 'TConjuntoEstadoActualizacion';
  CS_TVariantField = 'TCampoVariante';
  CS_TVarBytesField = 'TCampoBytesVariable';
  CS_TVarCharField = 'TCampoCadenaVariable';
  CS_TVarType = 'TipoDeVariante';
  CS_TWideStringField = 'TCampoCadenaAncha';
  CS_TWinControl = 'TControlDePantalla';
  CS_TWindowState = 'TEstadoPantalla';
  CS_TWMMenuChar = 'TMWCaracterMenu';
  CS_TWordField = 'TCampoOrdinalCorto';
  CS_varAny = 'varCualquiera';
  CS_varArray = 'varArreglo';
  CS_varBoolean = 'varLogico';
  CS_varByRef = 'varPorRef';
  CS_varByte = 'varByte';
  CS_varCurrency = 'varMoneda';
  CS_varDate = 'varFecha';
  CS_varDispatch = 'varDespachador';
  CS_varDouble = 'varReal';
  CS_varEmpty = 'varVacio';
  CS_varError = 'varError';
  CS_variant = 'variante';
  CS_varInt64 = 'varEntero_largo';
  CS_varInteger = 'varEntero';
  CS_varLongWord = 'varOrdinal_largo';
  CS_varNull = 'varNulo';
  CS_varOleStr = 'varCadena_ole';
  CS_varShortint = 'varEntero_minimo';
  CS_varSingle = 'varReal_corto';
  CS_varSmallInt = 'varEntero_corto';
  CS_varStrArg = 'varArgumento_cadena';
  CS_varString = 'varCadena';
  CS_varTypeMask = 'varMascaraDeTipo';
  CS_varUnknown = 'varDesconocido';
  CS_varVariant = 'varVariante';
  CS_varWord = 'varOrdinal_corto';
  CS_widechar = 'caracter_largo';
  CS_widestring = 'cadena_larga';
  CS_word = 'ordinal_corto';

{palabras reservadas}
  CS_of = 'de';
  CS_const = 'inmutable';

  CS_absolute = 'absoluto';
  CS_abstract = 'abstracto';
  CS_addressOf = '@';
  CS_and = 'Y';
  CS_array = 'arreglo';
  CS_array_of = CS_array + ' ' + CS_of + ' ';
  CS_array_of_const = CS_array_of + CS_const;
  CS_as = 'como';
  CS_asm = 'ensamb';
  CS_assembler = 'ensamblador';
  CS_assignment = '<-';
  CS_automated = 'automatizado';
  CS_begin = 'inicio';
  CS_break = 'interrumpir';
  CS_case = 'segun';
  CS_caseCase = 'caso';
  CS_cdecl = 'declaracionC';
  CS_CharChar = '#';
  CS_constructor = 'constructor ';
  CS_contains = 'contiene';
  CS_continue = 'continuar';
  CS_deprecated = 'deprecado';
  CS_dereference = '|';
  CS_destructor = 'destructor';
  CS_dispid = 'iddesp';
  CS_dispinterface = 'interfacedesp';
  CS_div = 'dividido';
  CS_Equal = '=';
  CS_pow = '^';
  CS_do = 'hacer';
  CS_downto = 'decrementar_hasta';
  CS_dynamic = 'dinamico';
  CS_else = 'sino';
  CS_end = 'fin';
  CS_endCase = 'fin_segun';
  CS_endFor = 'fin_variar';
  CS_endFunction = 'fin_funcion';
  CS_endIf = 'fin_si';
  CS_endIterar = 'fin_iterar';
  CS_endProcedure = 'fin_procedimiento';
  CS_endProgram = 'fin_programa';
  CS_endUnit = 'fin_subprogramas';
  CS_endRecord = 'fin_estructura';
  CS_endWhile = 'fin_mientras';
  CS_except = 'fallado';
  CS_exit = 'salir';
  CS_exports = 'exporta';
  CS_false = 'Falso';
  CS_far = 'lejano';
  CS_file = 'archivo';
  CS_final = 'final';
  CS_finalization = 'finalizacion';
  CS_finally = 'finalmente';
  CS_for = 'variar';
  CS_forFrom = 'desde';
  CS_forward = 'luego';
  CS_function = 'funcion';
  CS_function_end = 'fin_funcion';
  CS_helper = 'ayudante';
  CS_HexChar = '$';
  CS_iend = ''+chr(13);
  CS_if = 'Si';
  CS_implementation = 'implementacion';
  Cs_implements = 'implementa';
  CS_in = 'en';
  CS_inherited = 'heredado';
  CS_initialization = 'inicializacion';
  CS_inline = 'enlinea';
  CS_Interface = 'Interfaz';
  CS_is = 'es';
  CS_iterar = 'iterar';
  CS_label = 'rotulo';
  CS_library = 'libreria';
  CS_message = 'mensaje';
  CS_mod = 'modulo';
  CS_near = 'cercano';
  CS_crlf = 'salto';
  CS_nil = 'nulo';
  CS_nodefault = 'quitarporomision';
  CS_not = 'no';
  CS_NotEqual = '<>';
  CS_object = 'objeto';
  CS_on = 'cuando';
  CS_operator = 'operador';
  CS_or = 'O';
  CS_out = 'salida';
  CS_overload = 'sobrecargado';
  CS_override = 'sobrescrito';
  CS_package = 'paquete';
  CS_packed = 'apretado';
  CS_pascal = 'pascal';
  CS_platform = 'plataforma';
  CS_private = 'privado';
  CS_procedure = 'procedimiento';
  CS_procedure_end = 'fin_procedimiento';
  CS_program = 'programa';
  CS_program_end = 'fin_programa';
  CS_property = 'propiedad';
  CS_protected = 'protegido';
  CS_public = 'publico';
  CS_published = 'publicado';
  CS_quote = '"';
  CS_charQuote = '''';
  CS_raise = 'disparar';
  CS_register = 'registro';
  CS_reintroduce = 'reintroduce';
  CS_requires = 'requiere';
  CS_repeat = 'repetir';
  CS_resourcestring = 'recursodecadena';
  CS_result = 'resultado';
  CS_safecall = 'seguro';
  CS_salirSi = 'Salir_Si';
  CS_sealed = 'sellado';
  CS_set = 'conjunto';
  CS_set_of = CS_set + ' ' + CS_of + ' ';
  CS_shl = 'despi';
  CS_shr = 'despd';
  CS_stdcall = 'estandar';
  CS_step = 'paso';
  CS_stored = 'almacenado';
  CS_stringresource = 'cadenarecurso';
  CS_then = 'entonces';
  CS_to = 'hasta';
  CS_threadvar = 'variablehilo';
  CS_true = 'Verdadero';
  CS_try = 'intentar';
  CS_unit = 'subprogramas';
  CS_until = 'hasta_que';
  CS_uses = 'utiliza';
  CS_var = 'porRef';
  CS_virtual = 'virtual';
  CS_while = 'mientras';
  CS_with = 'con';
  CS_writeonly = 'soloescritura';
  CS_xor = 'oex';

{operaciones}
  CS_OpAdd='+';
  CS_OpSub='-';
  CS_OpMul='*';
  CS_OpDiv='/';
  CS_OpMod='modulo';
  CS_OpShl='despi';
  CS_Opshr='despd';
  CS_Opand='y';
  CS_Opor='o';
  CS_OpXor='oex';
  CS_OpAs='como';
  CS_OpPow='^';
  CS_OpIDiv='\';
  CS_OpGreaterEqual='>=';
  CS_OpLessEqual='<=';
  CS_OpGreater='>';
  CS_OpLess='<';
  CS_OpEqual='=';
  CS_OpNotEqual='<>';
  CS_OpIs='es';
  CS_OpIn='en';

{funciones y procedimientos}
  CS_Abs = 'ValorAbsoluto';
  CS_ActiveBuffer = 'RecipienteActivo';
  CS_Add = 'Agregar';
  CS_AddChild = 'AgregarHijo';
  CS_AddFieldDef = 'AgregarDefinicionCampo';
  CS_AddIndexDef = 'AgregarDefinicionIndice';
  CS_AddObject = 'AgregarObjeto';
  CS_AddParam = 'AgregarParametro';
  CS_AddStrings = 'AgregarCadenas';
  CS_AnsiLowercase = 'MinusculasAnsi';
  CS_AnsiUppercase = 'MayusculasAnsi';
  CS_AnyToString = 'aCadena';
  CS_Append = 'Agregar';
  CS_AppendRecord = 'AgregarRegistro';
  CS_Arc = 'Arco';
  CS_ArrangeIcons = 'AcomodarIconos';
  CS_AsBlob = 'ComoBlob';
  CS_AsBoolean = 'ComoLogico';
  CS_AsCurrency = 'ComoMoneda';
  CS_AsDate = 'ComoFecha';
  CS_AsDateTime = 'ComoFechaYHora';
  CS_AsFloat = 'ComoReal';
  CS_AsInteger = 'ComoEntero';
  CS_AsLargeInt = 'ComoEnteroGrande';
  CS_AsMemo = 'ComoMultilinea';
  CS_assign = 'Asignar';
  CS_assigned = 'asignado';
  CS_AssignField = 'AsignarCampo';
  CS_AssignFieldValue = 'AsignarValorCampo';
  CS_AssignValue = 'AsignarValor';
  CS_AssignValues = 'AsignarValores';
  CS_AsSmallInt = 'ComoEnteroCorto';
  CS_AsString = 'ComoCadena';
  CS_AsTime = 'ComoHora';
  CS_AsVariant = 'ComoVariante';
  CS_AsWord = 'ComoOrdinalCorto';
  CS_BeginDrag = 'ComenzarArrastre';
  CS_BeginUpdate = 'ComenzarActualizacion';
  CS_Bound = 'Enlazado';
  CS_BringToFront = 'TraerAlFrente';
  CS_CancelHint = 'CancelarConsejo';
  CS_CanFocus = 'PuedeEnfocarse';
  CS_Cascade = 'EnCascada';
  CS_charToInt = 'caracterACodigo';
  CS_CheckBrowseMode = 'VerificarModoNavegacion';
  CS_CheckFieldName = 'VerificarNombreCampo';
  CS_CheckFieldNAmes = 'VerificarNombresCampos';
  CS_CheckToken = 'VerificarPorcion';
  CS_CheckTokenSymbol = 'VerificarPorcionEsSimbolo';
  CS_Chord = 'SemiElipse';
  CS_Clear = 'Borrar';
  CS_ClearScreen = 'Limpiar';
  CS_ClearFields = 'LimpiarCampos';
  CS_ClearItem = 'VaciarElemento';
  CS_ClearSelection = 'BorrarSeleccion';
  CS_Click = 'Apretar';
  CS_ClientToScreen = 'InternoAEscritorio';
  CS_Close = 'Cerrar';
  CS_CloseFile = 'CerrarArchivo';
  CS_CloseQuery = 'AceptarCierre';
  CS_ContainsControl = 'ContieneControl';
  CS_ControlDestroyed = 'ControlDestruido';
  CS_ControlsDisabled = 'ControlesDeshabilitados';
  CS_Copy = 'Subcadena';
  CS_CopyFrom = 'CopiarDe';
  CS_CopyToClipboard = 'CopiarAlPortapapeles';
  CS_Cos = 'Coseno';
  CS_Create = 'Crear';
  CS_CreateBlobStream = 'CrearFlujoBlob';
  CS_CreateField = 'CrearCampo';
  CS_CreateFile = 'CrearArchivo';
  CS_CreateFromId = 'CrearEnBaseAID';
  CS_CreateHandle = 'CrearIdentificador';
  CS_CreateNew = 'CrearNuevo';
  CS_CreateOleObject = 'CrearObjetoOLE';
  CS_CreateParam = 'CrearParametro';
  CS_CursorPosChanged = 'CambioPosicionCursor';
  CS_CutToClipboard = 'CortarAlPortapapeles';
  CS_DataType = 'TipoDeDato';
  CS_Date = 'Fecha';
  CS_DateTimeToUnix = 'FechaYHoraAFormatoUnix';
  CS_DateToStr = 'FechaACadena';
  CS_DayOfWeek = 'DiaDeLaSemana';
  CS_Dec = 'Decrementar';
  CS_DecodeDate = 'DecodificarFecha';
  CS_DecodeTime = 'DecodificarHora';
  CS_DefocusControl = 'QuitarFoco';
  CS_Delete = 'Borrar';
  CS_DestroyComponents = 'DestruirComponentes';
  CS_Destroying = 'Destruyendo';
  CS_DisableAlign = 'DeshabilitarAlineamiento';
  CS_DisableControls = 'DeshabilitarControles';
  CS_DispatchCommand = 'DespacharComando';
  CS_DispatchPopUp = 'DespacharEmergente';
  CS_DllGetLastError = 'ObtenerUltimoErrorLED';
  CS_Dormant = 'Dormir';
  CS_Dragging = 'Arrastrando';
  CS_Draw = 'Dibujar';
  CS_DrawMenuItem = 'DibujarElementoMenu';
  CS_DropDownCount = 'CantidadDeFilasADeplegar';
  CS_dupAccept = 'dupAceptar';
  CS_dupError = 'dupError';
  CS_dupIgnore = 'dupIgnorar';
  CS_Edit = 'Editar';
  CS_Ellipse = 'Elipse';
  CS_EmptyFile = 'VaciarArchivo';
  CS_EnableAlign = 'HabilitarAlineamiento';
  CS_EnableControls = 'HabilitarControles';
  CS_EncodeDate = 'CodificarFecha';
  CS_EncodeTime = 'CodificarHora';
  CS_EndDrag = 'FinalizarArrastre';
  CS_EndUpdate = 'FinalizarActualizacion';
  CS_Equals = 'Iguales';
  CS_Error = 'Error';
  CS_ErrorStr = 'CadenaDeError';
  CS_ExceptionParam = 'ParametroExcepcion';
  CS_ExceptionPos = 'PosicionExcepcion';
  CS_ExceptionProc = 'ProcedimientoExcepcion';
  CS_ExceptionToString = 'ExcepcionACadena';
  CS_ExceptionType = 'TipoExcepcion';
  CS_Exchange = 'Intercambiar';
  CS_FieldByName = 'CampoPorNombre';
  CS_FieldByNumber = 'CampoPorNumero';
  CS_FilePos = 'PosicionArchivo';
  CS_FileSize = 'Tama�oArchivo';
  CS_FillRect = 'RellenarRectangulo';
  CS_Find = 'Buscar';
  CS_FindComponent = 'EncontrarComponente';
  CS_FindField = 'EncontrarCampo';
  CS_FindFirst = 'EncontrarPrimero';
  CS_FindIndexForFields = 'EncontrarIndiceParaCampos';
  CS_FindItem = 'EncontrarElemento';
  CS_FindItemId = 'EncontrarIdElemento';
  CS_FindLast = 'EncontrarUltimo';
  CS_FindNext = 'EncontrarSiguiente';
  CS_FindParam = 'EncontrarParametro';
  CS_FindPrior = 'EncontrarAnterior';
  CS_First = 'Primero';
  CS_FloatToStr = 'RealACadena';
  CS_FloodFill = 'Inundar';
  CS_Focused = 'Enfocado';
  CS_FormatDateTime = 'FormatoFechaYHora';
  CS_Free = 'Liberar';
  CS_FreeImage = 'LiberarImagen';
  CS_FreeNotification = 'AvisoDeDestruccion';
  CS_GetActiveOleObject = 'ObtenerObjetoOLEActivo';
  CS_GetArrayLength = 'LongitudArreglo';
  CS_GetCurrentRecord = 'ObtenerRegistroActual';
  CS_GetDataSize = 'ObtenerTama�oDeDato';
  CS_GetFieldNames = 'ObtenerNombresDeCampos';
  CS_GetFormImage = 'ObtenerImagenPantalla';
  CS_GetHelpContext = 'ObtenerContextoAyuda';
  CS_GetImageList = 'ObtenerListaImagenes';
  CS_GetINdexForFields = 'ObtenerIndiceParaCampos';
  CS_GetItemNames = 'ObetenerNombresElemento';
  CS_GetName = 'ObtenerNombre';
  CS_GetOLE2AcceleratorTable = 'ObtenerTablaDeAccesosOLE2';
  CS_GetParamList = 'ObtenerListaParametros';
  CS_GetParentComponent = 'ObtenerComponentePadre';
  CS_GetParentMenu = 'ObtenerMenuPadre';
  CS_GetSelTExtBuf = 'ObtenerRecipienteTextoSeleccionado';
  CS_GetText = 'ObtenerTexto';
  CS_GetTextBuf = 'ObtenerRecipienteTexto';
  CS_GetTextLen = 'ObtenerLongitudTexto';
  CS_HandleAllocated = 'IdentificadorEstablecido';
  CS_HandleException = 'ManejarExcepcion';
  CS_HandleMessage = 'ManejarMensaje';
  CS_HandleNeeded = 'IdentificadorRequerido';
  CS_HasChildDefs = 'TieneDefinicionesHijas';
  CS_HasParent = 'TienePadre';
  CS_HelpCommand = 'ComandoDeAyuda';
  CS_HelpContext = 'AyudaDeContexto';
  CS_HelpJump = 'SaltarALaAyuda';
  CS_HexToBinary = 'HexadecimalABinario';
  CS_HiddenFields = 'CamposOcultos';
  CS_Hide = 'Ocultar';
  CS_HideDragImage  = 'OcultarImagenArrastre';
  CS_HideHint = 'OcultarConsejo';
  CS_High = 'Mayor';
  CS_HintMouseMessage = 'MensajeConsejoRaton';
  CS_IDispatchInvoke = 'IDespachadorInvocar';
  CS_Inc = 'Incrementar';
  CS_IndexOf = 'IndiceDe';
  CS_indexOfName = 'IndiceDelNombre';
  CS_IndexOfObject = 'IndiceDelObjeto';
  CS_Initialize = 'Inicializar';
  CS_InitiateAction = 'IniciarAccion';
  CS_Insert = 'Insertar';
  CS_InsertComponent = 'InsertarComponente';
  CS_InsertControl = 'InsertarControl';
  CS_InsertNewLineAfter = 'InsertarNuevaLineaDespues';
  CS_InsertNewLineBefore = 'InsertarNuevaLineaAntes';
  CS_InsertObject = 'InsertarObjeto';
  CS_InsertRecord = 'InsertarRegistro';
  CS_Instance = 'Instancia';
  CS_Int = 'ParteEntera';
  CS_Int64ToStr = 'EnteroLargoACadena';
  CS_IntToChar = 'codigoACaracter';
  CS_IntToStr = 'EnteroACadena';
  CS_Invalidate = 'Invalidar';
  CS_IsEmpty = 'EstaVacio';
  CS_IsEqual = 'SonIguales';
  CS_IsLine = 'EsLinea';
  CS_IsLinkedTo = 'EstaRelacionadoA';
  CS_IsSequenced = 'EstaSecuenciado';
  CS_IsValidChar = 'CaracterEsValido';
  CS_Item = 'Elemento';
  CS_ItemAtPos = 'ElementoEnLaPosicion';
  CS_ItemRect = 'RectanguloElemento';
  CS_IsNull = 'VarEsNulo';
  CS_IsRightToLeft = 'DeDerechaAIzquierda';
  CS_Last = 'Ultimo';
  CS_Length = 'Longitud';
  CS_LineTo = 'Linea';
  CS_LoadFromClipboard = 'LeerDePortapapeles';
  CS_LoadFromClipboardFormat = 'LeerDeFormatoDePortapapeles';
  CS_LoadFromFile = 'LeerDeArchivo';
  CS_LoadFromResourceID = 'LeerDeIdentificadorRecurso';
  CS_LoadFromResourceName = 'LeerDeNombreRecurso';
  CS_LoadFromStream = 'LeerDeFlujo';
  CS_Locate = 'Localizar';
  CS_Lookup = 'Revisar';
  CS_Low = 'Menor';
  CS_Lowercase = 'Minusculas';
  CS_Merge = 'Unir';
  CS_MessageBox = 'PantallaDeMensaje';
  CS_Method = 'Metodo';
  CS_Minimize = 'Minimizar';
  CS_Move = 'Mover';
  CS_MoveBy = 'Desplazar';
  CS_MoveTo = 'MoverA';
  CS_Name = 'Nombre';
  CS_NativeStr = 'CadenasNativas';
  CS_Next = 'Siguiente';
  CS_NewBottomLine = 'NuevaLineaInferior';
  CS_NewItem = 'NuevoElemento';
  CS_NewLine = 'NuevaLinea';
  CS_NewMenu = 'NuevoMenu';
  CS_NewPopUpMenu = 'NuevoMenuEmergente';
  CS_NewSubMenu = 'NuevoSubMenu';
  CS_NewTopLine = 'NuevaLineaSuperior';
  CS_NextToken = 'SiguientePorcion';
  CS_NormalizeTopMosts = 'NormalizarPantallasSiempreVisibles';
  CS_NotificationVariantGet = 'ObtenerNotificacionVariante';
  CS_NotificationVariantSet = 'EstablecerNotificacionVariante';
  CS_Now = 'Ahora';
  CS_Null = 'varNULO';
  CS_odChecked = 'edMarcado';
  CS_odComboBoxEdit = 'edEdicionDeDesplegable';
  CS_odDefault = 'edPorOmision';
  CS_odDisabled = 'edDeshabilitado';
  CS_odFocused = 'edEnfocado';
  CS_odGrayed = 'edIndefinido';
  CS_odHotLight = 'edIluminando';
  CS_odInactive = 'edInactivo';
  CS_odNoAccel = 'edSinLetraAcceso';
  CS_odNoFocusRect = 'edSinRectanguloDeFoco';
  CS_odReserved1 = 'edReservado1';
  CS_odReserved2 = 'edReservado2';
  CS_odSelected = 'edSeleccionado';
  CS_Open = 'Abrir';
  CS_OpenBit = 'AbrirBit';
  CS_OpenFile = 'AbrirArchivo';
  CS_opInsert = 'opInsertar';
  CS_opRemove = 'opQuitar';
  CS_Padl = 'RellenoIzq';
  CS_Padr = 'RellenoDer';
  CS_Padz = 'RellenoCero';
  CS_PaintTo = 'DibujarEn';
  CS_ParamByName = 'ParametroPorNombre';
  CS_ParamType = 'TipoParametro';
  CS_ParentBiDiModeChanged = 'ModoBiDiPadreCambio';
  CS_ParseSQL = 'InterpretarSQL';
  CS_PasteFromClipboard = 'PegarDelPortapapeles';
  CS_Perform = 'Realizar';
  CS_Pi = 'Pi';
  CS_Pie = 'Porcion';
  CS_PopulateOle2Menu = 'LlenarMenuOLE2';
  CS_PopUp = 'MostrarEmergente';
  CS_Pos = 'Posicion';
  CS_Post = 'Aceptar';
  CS_pred = 'predecesor';
  CS_Previous = 'Previo';
  CS_Print = 'Imprimir';
  CS_Prior = 'Anterior';
  CS_ProcessMenuChar = 'ProcesarCaracterMenu';
  CS_ProcessMessages = 'ProcesarMensajes';
  CS_RaiseException = 'DispararExcepcion';
  CS_RaiseLastException = 'DispararUltimaExcepcion';
  CS_Random = 'Aleatorio';
  CS_Read = 'Leer';
  CS_ReadBuffer = 'LeerRecipiente';
  CS_ReadDateTime = 'LeerFechaYHora';
  CS_ReadFile = 'LeerArchivo';
  CS_ReadLn = 'LeerRenglon';
  CS_Realign = 'Realinear';
  CS_Rectangle = 'Rectangulo';
  CS_Refresh = 'Refrescar';
  CS_REfreshLookupList = 'RefrescarListaDeRevision';
  CS_Release = 'Liberar';
  CS_ReleaseHandle = 'LiberarIdentificador';
  CS_ReleasePalette = 'LiberarPaleta';
  CS_Remove = 'Quitar';
  CS_RemoveComponent = 'QuitarComponente';
  CS_RemoveControl = 'QuitarControl';
  CS_RemoveFirst = 'menosPrimero';
  CS_RemoveLast = 'menosUltimo';
  CS_RemoveParam = 'QuitarParametro';
  CS_Repaint = 'Redibujar';
  CS_Replace = 'Reemplazar';
  CS_Replicate = 'Replicar';
  CS_Restore = 'Restaurar';
  CS_RestoreTopMosts = 'RestaurarPantallasSiempreVisibles';
  CS_RethinkHotKeys = 'RepensarTeclasDeAcceso';
  CS_RethinkLines = 'RepensarLineas';
  CS_Round = 'Redondear';
  CS_RoundRect = 'RectanguloRedondeado';
  CS_Run = 'Ejecutar';
  CS_SameText = 'MismoTexto';
  CS_SameType = 'MismoTipo';
  CS_SaveToClipboardFormat = 'GuardarEnFormatoDePortapapeles';
  CS_ScaleBy = 'CambiarEscala';
  CS_ScreenToClient = 'EscritorioAInterno';
  CS_ScrollBy = 'Desplazar';
  CS_ScrollInView = 'DesplazarHastaVisible';
  CS_Seek = 'Posicionar';
  CS_SeekFile = 'PosicionarArchivo';
  CS_SelectAll = 'SeleccionarTodo';
  CS_SendCancelMode = 'EnviarModoDeCancelacion';
  CS_SendToBack = 'EnviarAlFondo';
  CS_SetArrayLength = 'EstablecerLongitudArreglo';
  CS_SetBounds = 'EstablecerLimites';
  CS_SetFields = 'EstablecerCampos';
  CS_SetFieldType = 'EstablecerTipoCampo';
  CS_SetFocus = 'Enfocar';
  CS_SetFocusedControl = 'EstablecerControlEnfocado';
  CS_SetLength = 'EstablecerLongitud';
  CS_SetOle2MenuHandle = 'EstablecerIdentificadorMenuOLE2';
  CS_SetParams = 'EstablecerParametros';
  CS_SetSelTextBuf = 'EstablecerRecipienteTextoSeleccionado';
  CS_SetSize = 'EstablecerTama�o';
  CS_SetText = 'EstablecerTexto';
  CS_SetTextBuf = 'EstablecerRecipienteTexto';
  CS_ShortCutToKey = 'AtajoATeclas';
  CS_ShortCutToText = 'AtajoACadena';
  CS_Show = 'Mostrar';
  CS_ShowAndRead = 'MostrarYLeer';
  CS_ShowDragImage = 'MostrarImagenArrastre';
  CS_ShowModal = 'MostrarYEsperar';
  CS_Sin = 'Seno';
  CS_SizeOf = 'Tama�oDe';
  CS_Sort = 'Ordenar';
  CS_Sorted = 'Ordenado';
  CS_SourcePos = 'PosicionAlgoritmo';
  CS_Sqrt = 'Raiz2';
  CS_StringOfChar = 'HacerCadenaDe';
  {uso interno}
  CS_StrSet = 'StrSet';
  CS_StrGet = 'StrGet';
  CS_StrGet2 = 'StrGet2';
  
  CS_StrToDate = 'CadenaAFecha';
  CS_StrToFloat = 'CadenaAReal';
  CS_StrToInt = 'CadenaAEntero';
  CS_StrToInt64 = 'CadenaAEnteroLargo';
  CS_StrToIntDef = 'CadenaAEnteroPorOmision';
  CS_succ = 'sucesor';
  CS_Terminate = 'Terminar';
  CS_TextHeight = 'AltoTexto';
  CS_TextOut = 'PonerTexto';
  CS_TextToShortCut = 'CadenaAAtajo';
  CS_TextWidth = 'AnchoTexto';
  CS_Tile = 'EnMosaico';
  CS_Time = 'Hora';
  CS_TokenComponentIdent = 'FALTA!!';
  CS_TokenFloat = 'FALTA!!';
  CS_TokenInt = 'FALTA!!';
  CS_TokenString = 'FALTA!!';
  CS_TokenSymbol = 'FALTA!!';
  CS_TokenSymbolIs = 'FALTA!!';
  CS_Translate = 'Traducir';
  CS_Trim = 'Recortar';
  CS_Trunc = 'Truncar';
  CS_TryEncodeDate = 'IntentarCodificarFecha';
  CS_TryEncodeTime = 'IntentarCodificarHora';
  CS_Unassigned = 'varNoAsignado';
  CS_UnixToDateTime = 'FormatoUnixAFechaYHora';
  CS_Unknown = 'desconocido';
  CS_UnloadDll = 'LiberarLED';
  CS_UnMerge = 'Separar';
  CS_Update = 'Actualizar';
  CS_UpdateControlState = 'ActualizarEstadoControl';
  CS_UpdateCursorPos = 'ActualizarPosicionCursor';
  CS_UpdateRecord = 'ActualizarRegistro';
  CS_UpdateStatus = 'EstadoActualizacion';
  CS_Uppercase = 'Mayusculas';
  CS_Usucc = 'Sucesor';
  CS_ValidFile = 'ValidoArchivo';
  CS_Value = 'Valor';
  CS_ValueOfKey = 'ValorDeClave';
  CS_VarIsEmpty = 'varEsVacio';
  CS_VarIsNull = 'varEsNulo';
  CS_VarType = 'TipoVariante';
  CS_Wait = 'Esperar';
  CS_whatType = 'queTipo';
  CS_Write = 'Escribir';
  CS_WriteBuffer = 'EscribirRecipiente';
  CS_WriteFile = 'EscribirArchivo';
  CS_Writeln = 'EscribirRenglon';
  CS_WStrGet = 'ObtenerCadenaLarga';
  CS_WStrSet = 'EstablecerCadenaLarga';

{otros}
  CS_Action = 'Accion';
  CS_Active = 'Activo';
  CS_ActiveControl = 'ControlActivo';
  CS_ActiveMDIChild = 'HijoMDIHijo';
  CS_ActiveOleControl = 'ControlOLEActivo';
  CS_ActivePage = 'PaginaActiva';
  CS_AfterCancel = 'DespuesDeCancelar';
  CS_AfterClose = 'DespuesDeCerrar';
  CS_AfterDelete = 'DespuesDeBorrar';
  CS_AfterEdit = 'DespuesDeEditar';
  CS_AfterInsert = 'DespuesDeInsertar';
  CS_AfterOpen = 'DespuesDeAbrir';
  CS_AfterPost = 'DespuesDeAceptar';
  CS_AfterRefresh = 'DespuesDeRefrescar';
  CS_AfterScroll = 'DespuesDeDesplazarse';
  CS_AggFields = 'CamposContadores';
  CS_akBottom = 'taAbajo';
  CS_akLeft = 'taIzquierda';
  CS_akRight = 'taDerecha';
  CS_akTop = 'taArriba';
  CS_alBottom = 'alAbajo';
  CS_alClient = 'alInterno';
  CS_Align = 'Alineamiento';
  CS_Alignment = 'Alineacion';
  CS_alLeft = 'alIzquierda';
  CS_AllowAllUp = 'PermitirTodosSinApretar';
  CS_AllowGrayed = 'PermitirIndefinido';
  CS_AllowResize = 'PermitirRedimensionado';
  CS_alNone = 'alNinguno';
  CS_alRight = 'alDerecha';
  CS_alTop = 'alArriba';
  CS_Application = 'Programa';
  CS_arAutoinc = 'aaAutoincremento';
  CS_arDefault = 'aaPorOmision';
  CS_arNone = 'aaNinguna';
  CS_AsBCD = 'ComoDecimalCodificadoEnBinario';
  CS_Attributes = 'Atributos';
  CS_AttributeSet = 'ConjuntoAtributos';
  CS_AutoCalcFields = 'AutocalcularCampos';
  CS_AutoGenerateValue = 'AutogenerarValor';
  CS_AutoHotKeys = 'TeclasDeAccesoAutomaticas';
  CS_AutoLineReduction = 'ReduccionAutomaticaDeLineas';
  CS_AutoMerge = 'UnirAutomaticamente';
  CS_AutoPopUp = 'EmergentesAutomaticos';
  CS_AutoScroll = 'DesplazamientoAutomatico';
  CS_AutoSelect = 'SeleccionAutomatica';
  CS_AutoSize = 'AutoDimensionar';
  CS_Base = 'Base';
  CS_BeforeCancel = 'AntesDeCancelar';
  CS_BeforeClose = 'AntesDeCerrar';
  CS_BeforeDelete = 'AntesDeBorrar';
  CS_BeforeEdit = 'AntesDeEditar';
  CS_BeforeInsert = 'AntesDeInsertar';
  CS_BeforeOpen = 'AntesDeAbrir';
  CS_BeforePost = 'AntesDeAceptar';
  CS_BeforeRefresh = 'AntesDeRefrescar';
  CS_BeforeScroll = 'AnsteDeDesplazarse';
  CS_BevelInner = 'DesnivelInterno';
  CS_BevelOuter = 'DesnivelExterno';
  CS_BevelWidth = 'AnchoDesnivel';
  CS_BiDiMode = 'ModoBiDi';
  CS_biHelp = 'ipAyuda';
  CS_biMaximize = 'ipMaximizar';
  CS_biMinimize = 'ipMinimizar';
  CS_biSystemMenu = 'ipMenuDeSistema';
  CS_BitMap = 'MapaDeBits';
  CS_Bits = 'Bits';
  CS_bkAbort = 'tbAbortar';
  CS_bkAll = 'tbTodo';
  CS_bkCancel = 'tbCancelar';
  CS_bkClose = 'tbCerrar';
  CS_bkCustom = 'tbParticular';
  CS_bkHelp = 'tbAyuda';
  CS_bkIgnore = 'tbIgnorar';
  CS_bkNo = 'tbNo';
  CS_bkOk = 'tbAceptar';
  CS_bkRetry = 'tbReintentar';
  CS_bkYes = 'tbSi';
  CS_blGlyphBottom = 'dbImagenAbajo';
  CS_blGlyphLeft = 'dbImagenALaIzq';
  CS_blGlyphRight = 'dbImagenALaDer';
  CS_blGlyphTop = 'dbImagenArriba';
  CS_BlobSize = 'Tama�oBlob';
  CS_BlobType = 'TipoBlob';
  CS_BlockReadSize = 'Tama�oBloqueLectura';
  CS_bmRead = 'mbLectura';
  CS_bmReadWrite = 'mbLecturaYEscritura';
  CS_bmWrite = 'mbEscritura';
  CS_BNOT = 'bnot';
  CS_BOF = 'EsElComienzo';
  CS_BorderIcons = 'IconosDePantalla';
  CS_BorderStyle = 'EstiloDeBorde';
  CS_BorderWidth = 'AnchoDeBorde';
  CS_Brush = 'Brocha';
  CS_bsAutoDetect = 'ebAutoDetectar';
  CS_bsBDiagonal = 'ebDiagonalInversa';
  CS_bsBottomLine = 'fdLineaAbajo';
  CS_bsBox = 'fdCuadro';
  CS_bsClear = 'ebLimpio';
  CS_bsCross = 'ebCruzado';
  CS_bsDiagCross = 'ebCruzadoDiagonal';
  CS_bsDialog = 'tbpDialogo';
  CS_bsDisabled = 'ebDeshabilitado';
  CS_bsDown = 'ebOprimido';
  CS_bsExclusive = 'ebExclusivo';
  CS_bsFDiagonal = 'ebDiagonal';
  CS_bsFrame = 'fdRecuadro';
  CS_bsHorizontal = 'ebLineaH';
  CS_bsLeftLine = 'fdLineaIzquierda';
  CS_bsLowered = 'edHaciaAbajo';
  CS_bsNew = 'ebNuevo';
  CS_bsNone = 'tbpNinguno';
  CS_bsRaised = 'edHaciaArriba';
  CS_bsRightLine = 'fdLineaDerecha';
  CS_bsSingle = 'tbpSimple';
  CS_bsSizeable = 'tbpRedimensionable';
  CS_bsSizeToolWin = 'tbpBarraHerramientasRedimensionable';
  CS_bsSolid = 'ebSolido';
  CS_bsSpacer = 'fdEspaciado';
  CS_bsToolWindow = 'tbpBarraHerramientas';
  CS_bsTopLine = 'fdLineaArriba';
  CS_bsUp = 'ebLevantado';
  CS_bsVertical = 'ebLineaV';
  CS_bsWin31 = 'ebWindows31';
  CS_bvLowered = 'dpHaciaAbajo';
  CS_bvNone = 'dpNinguno';
  CS_bvRaised = 'dpHaciaArriba';
  CS_bvSpace = 'dpEspaciado';
  CS_caFree = 'acDestruir';
  CS_caHide = 'acOcultar';
  CS_Calc = 'C�lculo';
  CS_Calculated = 'Calculado';
  CS_Call = 'Llama';
  CS_CALLVAR = 'Llamada variable';
  CS_caMinimize = 'acMinimizar';
  CS_Cancel = 'Cancelar';
  CS_Cancelling = 'Cancelando';
  CS_CanModify = 'Modificable';
  CS_caNone = 'acNinguna';
  CS_Canvas = 'Lienzo';
  CS_Caption = 'Texto';
  CS_CaseInsFields = 'CamposNoSensibles';
  CS_cbChecked = 'evMarcado';
  CS_cbGrayed = 'evIndefinido';
  CS_cbUnchecked = 'evSinMarcar';
  CS_Center = 'Centrado';
  CS_Charcase = 'EstiloDeTexto';
  CS_Checked = 'Marcado';
  CS_ChildDefs = 'DefinicionesHijas';
  CS_cl3DDkShadow = 'clSombra3D';
  CS_cl3DLight = 'clLuz3D';
  CS_clActiveBorder = 'clBordeActivo';
  CS_clActiveCaption = 'clTituloActivo';
  CS_clAppWorkSpace = 'clEspacioDeTrabajoPrograma';
  CS_clAqua = 'clCeleste';
  CS_clBackground = 'clFondo';
  CS_clBlack = 'clNegro';
  CS_clBlue = 'clAzul';
  CS_clBtnFace = 'clCaraBoton';
  CS_clBtnHighlight = 'clBotonResaltado';
  CS_clBtnShadow = 'clSombraBoton';
  CS_clBtnText = 'clTextoBoton';
  CS_clCaptionText = 'clTextoTitulo';
  CS_clDefault = 'clPorOmision';
  CS_clDkGray = 'clGrisOscuro';
  CS_clFuchsia = 'clFucsia';
  CS_clGray = 'clGris';
  CS_clGrayText = 'clTextoDifuminado';
  CS_clGreen = 'clVerde';
  CS_clHighlight = 'clResaltado';
  CS_clHighlightText = 'clTextoResaltado';
  CS_ClientHandle = 'IdentificadorCliente';
  CS_ClientHeight = 'AltoInterno';
  CS_ClientWidth = 'AnchoInterno';
  CS_clInactiveBorder = 'clBordeInactivo';
  CS_clInactiveCaption = 'clTituloInactivo';
  CS_clInactiveCaptionText = 'clTextoTituloInactivo';
  CS_clInfoBk = 'clFondoAyuda';
  CS_clInfoText = 'clTextoAyuda';
  CS_clLime = 'clLima';
  CS_clLtGray = 'clGrisClaro';
  CS_clMaroon = 'clMarron';
  CS_clMenu = 'clMenu';
  CS_clMenuText = 'clTextoMenu';
  CS_clNavy = 'clAzulMarino';
  CS_clNone = 'clNinguno';
  CS_clOlive = 'clVerdeOliva';
  CS_clPurple = 'clVioleta';
  CS_clRed = 'clRojo';
  CS_clScrollBar = 'clBarraDesplazamiento';
  CS_clSilver = 'clPlateado';
  CS_clTeal = 'clTeal';
  CS_clWhite = 'clBlanco';
  CS_clWindow = 'clPantalla';
  CS_clWindowFrame = 'clBordePantalla';
  CS_clWindowText = 'clTextoPantalla';
  CS_clYellow = 'clAmarillo';
  CS_Collection = 'Coleccion';
  CS_Color = 'Color';
  CS_Columns = 'Columnas';
  CS_Command = 'Comando';
  CS_CommaText = 'TextoSeparadoPorComas';
  CS_COMPARE = 'Comparar';
  CS_ComponentCount = 'CantidadDeComponentes';
  CS_ComponentIndex = 'IndiceComponente';
  CS_Components = 'Componentes';
  CS_ComponentState = 'EstadoComponente';
  CS_COND_GOTO = 'Salto condicional';
  CS_COND_NOT_GOTO = 'Salto condicional negado';
  CS_ConstraintErrorMessage = 'MensajeErrorRestriccion';
  CS_ControlCount = 'CantidadControles';
  CS_Controls = 'Controles';
  CS_CopyMode = 'ModoDeCopiado';
  CS_Count = 'Cantidad';
  CS_crAppStart = 'crInicioPrograma';
  CS_crArrow = 'crFlecha';
  CS_crCross = 'crCruz';
  CS_crDefault = 'crPorOmision';
  CS_crDrag = 'crArrastre';
  CS_crHandPoint = 'crMano';
  CS_crHelp = 'crAyuda';
  CS_crHourGlass = 'crRelojArena';
  CS_crHSplit = 'crDivisionHorizontal';
  CS_crIBeam = 'crBarraVertical';
  CS_crMultiDrag = 'crArrastreMultiple';
  CS_crNo = 'crNo';
  CS_crNoDrop = 'crNoSoltar';
  CS_crNone = 'crNinguno';
  CS_crSizeAll = 'crDimensionar';
  CS_crSizeNESW = 'crDimensionarNESO';
  CS_crSizeNS = 'crDimensionarNS';
  CS_crSizeNWSE = 'crDimensionarNOSE';
  CS_crSizeWE = 'crDimensionarEO';
  CS_crSQLWait = 'crEsperaSQL';
  CS_crUpArrow = 'crFlechaArriba';
  CS_crVSplit = 'crDivisionVertical';
  CS_csAncestor = 'ecAncestro';
  CS_csDesigning = 'ecDise�ando';
  CS_csDesignInstance = 'ecDise�oInstancia';
  CS_csDestroying = 'ecDestruyendo';
  CS_csDropDown = 'edDesplegable';
  CS_csDropDownList = 'edListaDesplegable';
  CS_csFixups = 'ecCorrigiendo';
  CS_csFreeNotification = 'ecNotificacionDestruccion';
  CS_csInline = 'ecEnLinea';
  CS_csLoading = 'ecRecuperando';
  CS_csOwnerDrawFixed = 'edDibujadoParticularAltoFijo';
  CS_csOwnerDrawVariable = 'edDibujadoParticularAltoVariable';
  CS_csReading = 'ecLeyendo';
  CS_csSimple = 'edSimple';
  CS_csUpdating = 'ecActualizando';
  CS_csWriting = 'ecEscribiendo';
  CS_Ctl3d = 'ControlEn3D';
  CS_Cursor = 'Cursor';
  CS_CurValue = 'ValorActual';
  CS_CustomConstraint = 'RestriccionParticular';
  CS_daAbort = 'adAbortar';
  CS_daFail = 'adFallar';
  CS_daRetry = 'adReintentar';
  CS_DataSet = 'ConjuntoDeDatos';
  CS_DataSetField = 'CampoConjuntoDeDatos';
  CS_DataSize = 'Tama�oDeDatos';
  CS_DataSource = 'FuenteDeDatos';
  CS_DateDelta = 'DiferenciaFecha';
  CS_Default = 'PorOmision';
  CS_DefaultExpression = 'ExpresionPorOmision';
  CS_DefaultFields = 'CamposPorOmision';
  CS_DescFields = 'CamposDescendentes';
  CS_Designer = 'Dise�ador';
  CS_DesignInfo = 'InformacionDeDise�o';
  CS_DialogHandle = 'IdntificadorDeDialogo';
  CS_Disam_Except = ' Error al descompilar';
  CS_DisplayFormat = 'FormatoParaMostrar';
  CS_DisplayLabel = 'RotuloParaMostrar';
  CS_DisplayName = 'NombreParaMostrar';
  CS_DisplayText = 'TextoParaMostrar';
  CS_DisplayValues = 'ValoresParaMostrar';
  CS_DisplayWidth = 'AnchoParaMostrar';
  CS_dkDock = 'taPegado';
  CS_dkDrag = 'taArrastre';
  CS_dmAutomatic = 'maAutomatico';
  CS_dmManual = 'maManual';
  CS_Down = 'Apretado';
  CS_DragCursor = 'CursorDeArrastre';
  CS_DragHandle = 'IdntificadorArrastre';
  CS_DragMode = 'ModoDeArrastre';
  CS_DragOver = 'ArrastrarPorEncima';
  CS_DragPos = 'PosicionArrastre';
  CS_DragTarget = 'DestinoArrastre';
  CS_DragTargetPos = 'PosicionDestinoArrastre';
  CS_DROPPEDDOWN = 'Desplegado';
  CS_DropTarget = 'DestinoDeArrastre';
  CS_dsBlockRead = 'ecdLecturaEnBloque';
  CS_dsBrowse = 'ecdNavegando';
  CS_dsCalcFields = 'ecdCalculandoCampos';
  CS_dsCurValue = 'ecdValorActual';
  CS_dsDragEnter = 'eaComienzoArrastre';
  CS_dsDragLeave = 'eaFinArrastre';
  CS_dsDragMove = 'eaMovimientoArrastre';
  CS_dsEdit = 'ecdEditando';
  CS_dsFilter = 'ecdFiltrando';
  CS_dsInactive = 'ecdInactivo';
  CS_dsInsert = 'ecdInsertando';
  CS_dsInternalCalc = 'ecdCalculoInterno';
  CS_dsOldValue = 'ecdValorViejo';
  CS_dsOpening = 'ecdAbriendo';
  CS_dsNewValue = 'ecdValorNuevo';
  CS_dsSetKey = 'ecdEstableciendoClave';
  CS_Duplicates = 'Duplicados';
  CS_Enabled = 'Habilitado';
  CS_ecLowercase = 'etMinusculas';
  CS_ecNormal = 'etNormal';
  CS_ecUpperCase = 'etMayusculas';
  CS_EditFormat = 'FormatoParaEdicion';
  CS_EditMask = 'MascaraEdicion';
  CS_EditMaskPtr = 'PunteroMascaraEdicion';
  CS_Empty = 'Vacio';
  CS_EOF = 'EnElFinal';
  CS_erCannotImport = 'eNoSePuedeImportar';
  CS_erCouldNotCallProc = 'eNoSePuedeInvocarElProcedimiento';
  CS_erCustomError = 'eErrorParticular';
  CS_erDivideByZero = 'eDivisionPorCero';
  CS_erException = 'eExcepcion';
  CS_erInterfaceNotSupported = 'eInterfaceNoSoportada';
  CS_erInternalError = 'eErrorInterno';
  CS_erInvalidHeader = 'eCabeceraNoValida';
  CS_erInvalidOpcode = 'eCodigoDeOperacionNoValido';
  CS_erInvalidOpcodeParameter = 'eParametroDeOperacionNoValido';
  CS_erInvalidType = 'eTipoNoValido';
  CS_erMathError = 'eErrorMatematico';
  CS_erNoError = 'eSinError';
  CS_erNoMainProc = 'eNoHayPrograma';
  CS_erNullPointerException = 'eExcepcionDePunteroNulo';
  CS_erNullVariantError = 'eErrorDeVarianteNulo';
  CS_erOutOfGlobalVarsRange = 'eFueraDelRangoDeVariablesGlobales';
  CS_erOutOfMemory = 'eSeAgotoLaMemoria';
  CS_erOutOfProcRange = 'eFueraDelRangoDeProcedimientos';
  CS_erOutOfRange = 'eFueraDeRango';
  CS_erOutOfRecordRange = 'eFueraDeRangoEnEstructura';
  CS_erOutOfStackRange = 'eFueraDeRangoDePila';
  CS_erTypeMismatch = 'eTiposIncorrectos';
  CS_erUnexpectedEof = 'eFinDeArchivoInesperado';
  CS_erVersionError = 'eErrorDeVersion';
  CS_Example = 'Ejemplo';
  CS_ExeName = 'NombrePrograma';
  CS_Export = 'Exporta';
  CS_Expression = 'Expresion';
  CS_ExtendedSelect = 'SeleccionExtendida';
  CS_External = 'Externo';
  CS_External_Decl = 'Declaraci�n externa';
  CS_faFixed = 'acFijo';
  CS_faHiddenCol = 'acColumnaOculta';
  CS_faLink = 'acEnlace';
  CS_faReadOnly = 'acSoloLectura';
  CS_faRequired = 'acRequerido';
  CS_faUnnamed = 'acSinNombre';
  CS_FieldClass = 'ClaseCampo';
  CS_FieldCount = 'CantidadCampos';
  CS_FieldDefList = 'ListaDefinicionCampos';
  CS_FieldDefs = 'DefinicionCampos';
  CS_FieldExpression = 'ExpresionCampo';
  CS_FieldKind = 'TipoCampo';
  CS_FieldList = 'ListaCampos';
  CS_FieldName = 'NombreCampo';
  CS_FieldNo = 'NumeroCampo';
  CS_Fields = 'Campos';
  CS_FieldValues = 'ValoresCampos';
  CS_Filter = 'Filtro';
  CS_Filtered = 'Filtrado';
  CS_FilterOptions = 'OpcionesFiltrado';
  CS_FixedChar = 'CaracterFijo';
  CS_fkAggregate = 'tcContabilizador';
  CS_fkCalculated = 'tcCalculado';
  CS_fkCommand = 'elComando';
  CS_fkData = 'tcDato';
  CS_fkHandle = 'elIdentificador';
  CS_fkInternalCalc = 'tcCalculadoInternamente';
  CS_fkLookup = 'tcRevisado';
  CS_fkShortcut = 'elAtajo';
  CS_FLAGGOTO = 'Bandera de Salto';
  CS_fmCreate = 'maCrear';
  CS_fmOpenRead = 'maAbrir';
  CS_fmOpenReadWrite = 'maLeerYEscribir';
  CS_fmOpenWrite = 'maEscribir';
  CS_fmShareCompat = 'maCompartido';
  CS_fmShareDenyNone = 'maNoRechazar';
  CS_fmShareDenyRead = 'maRechazarLectura';
  CS_fmShareDenyWrite = 'maRechazarEscritura';
  CS_fmShareExclusive = 'maExclusivo';
  CS_FocusControl = 'ControlAEnfocar';
  CS_Font = 'Fuente';
  CS_FormStyle = 'EstiloPantalla';
  CS_Found = 'Encontrado';
  CS_fpDefault = 'afPorOmision';
  CS_fpFixed = 'afFijo';
  CS_fpVariable = 'afVariable';
  CS_fsBold = 'efGruesa';
  CS_fsItalic = 'efCursiva';
  CS_fsMDIChild = 'epHijoMDI';
  CS_fsMDIForm = 'epPantallaMDI';
  CS_fsNormal = 'epNormal';
  CS_fsStayOnTop = 'epSiempreVisible';
  CS_fsStrikeOut = 'efTachada';
  CS_fsUnderline = 'efSubrayada';
  CS_ftADT = 'tcADT';
  CS_ftArray = 'tcArreglo';
  CS_ftAutoInc = 'tcAutoincremental';
  CS_ftBCD = 'tcDecimalCodificadoEnBinario';
  CS_ftBlob = 'tcBlob';
  CS_ftBoolean = 'tcLogico';
  CS_ftBytes = 'tcBytes';
  CS_ftCurrency = 'tcMoneda';
  CS_ftCursor = 'tcCursor';
  CS_ftDataSet = 'tcConjuntoDeDatos';
  CS_ftDate = 'tcFecha';
  CS_ftDateTime = 'tcFechaYHora';
  CS_ftDBaseOle = 'tcOleDBase';
  CS_ftFixedChar = 'tcCadenaFijo';
  CS_ftFloat = 'tcReal';
  CS_ftFmtBCD = 'tcDecimalCodificadoEnBinarioConFormato';
  CS_ftFmtMemo = 'tcBlobTextoConFormato';
  CS_ftGraphic = 'tcBlobGrafico';
  CS_ftGUID = 'tcGUID';
  CS_ftIDispatch = 'tcIDespachador';
  CS_ftInteger = 'tcEntero';
  CS_ftInterface = 'tcInterface';
  CS_ftLargeInt = 'tcEnteroLargo';
  CS_ftMemo = 'tcBlobMultilinea';
  CS_ftOraBlob = 'tcBlobOracle';
  CS_ftOraClob = 'tcClobOracle';
  CS_ftParadoxOle = 'tcOleParadox';
  CS_ftReference = 'tcReferencia';
  CS_ftSmallint = 'tcEnteroPeque�o';
  CS_ftString = 'tcCadena';
  CS_ftTime = 'tcHora';
  CS_ftTimeStamp = 'tcEstampaDeTiempo';
  CS_ftTypedBinary = 'tcBinarioTipificado';
  CS_ftUnknown = 'tcDesconocido';
  Cs_ftVarBytes = 'tcBytesVariable';
  CS_ftVariant = 'tcVariante';
  CS_ftWideString = 'tcCadenaAncha';
  CS_ftWord = 'tcOrdinalCorto';
  CS_FullName = 'NombreCompleto';
  CS_GlobalVar = 'Variable Global';
  CS_Glyph = 'Imagen';
  CS_GOTO = 'Salta';
  CS_GroupIndex = 'IndiceDeGrupo';
  CS_GroupingLevel = 'NivelAgrupamiento';
  CS_Haccel = 'IdentificadorAcceso';
  CS_Handle = 'Identificador';
  CS_HasConstraints = 'TieneRestricciones';
  CS_HBitmap = 'IdentificadorMapaDeBits';
  CS_Height = 'Alto';
  CS_HelpFile = 'ArchivoDeAyuda';
  CS_HideSelection = 'OcultarSeleccion';
  CS_Hint = 'Consejo';
  CS_HintColor = 'ColorDelConsejo';
  CS_HintHidePause = 'PauseOcultarConsejo';
  CS_HintPause = 'PausaDeConsejo';
  CS_HintShortPause = 'PausaCortaDeConsejo';
  CS_HMenu = 'IdentificadorMenu';
  CS_HorzScrollBar = 'BarraDesplazamientoHorizontal';
  CS_HPalette = 'IdentificadorPaleta';
  CS_Icon = 'Icono';
  CS_ID = 'Id';
  CS_IgnorePalette = 'IgnorarPaleta';
  CS_ImageIndex = 'IndiceImagen';
  CS_Images = 'Imagenes';
  CS_ImportedConstraint = 'RestriccionImportada';
  CS_IncludeObjectField = 'IncluirCampoObjeto';
  CS_Increment = 'Incremento';
  CS_Index = 'Indice';
  CS_INOT = 'inot';
  CS_IntegralHeight = 'AltoTotal';
  CS_InternalCalcField = 'CampoCalculadoInterno';
  CS_Interval = 'Intervalo';
  CS_into = 'en';
  CS_IsIndexField = 'CampoPerteneceAIndice';
  CS_ItemClass = 'ClaseElemento';
  CS_ItemHeight = 'AltoElemento';
  CS_ItemIndex = 'IndiceElemento';
  CS_Items = 'Elementos';
  CS_ixCaseInsensitive = 'oiInsensible';
  CS_ixDescending = 'oiDescendente';
  CS_ixExpression = 'oiExpresion';
  CS_ixNonMaintained = 'oiNoMantenido';
  CS_ixPrimary = 'oiPrimario';
  CS_ixUnique = 'oiUnico';
  CS_KeyFields = 'CamposClaves';
  CS_KeyPreview = 'CapturarTecleo';
  CS_Kind = 'Tipo';
  CS_LargeChange = 'CambioGrande';
  CS_LargeInt = 'EnteroLargo';
  CS_Layout = 'Distribucion';
  CS_lbOwnerDrawFixed = 'elDibujadoParticularAltoFijo';
  CS_lbOwnerDrawVariable = 'elDibujadoParticularAltoVariable';
  CS_lbStandard = 'elEstandar';
  CS_Left = 'Izquierda';
  CS_Lines = 'Lineas';
  CS_loCaseInsensitive = 'olInsensible';
  CS_Locked = 'Bloqueado';
  CS_LookupCache = 'ConservarRevisiones';
  CS_LookupDataSet = 'ConjuntoDeDatosDeRevision';
  CS_LookupKeyFields = 'CamposClaveDeRevision';
  CS_LookupList = 'ListaRevision';
  CS_lookupResultField = 'CampoResultadoRevision';
  CS_LoosyAssignment = 'Asignaci�n con p�rdida';
  CS_UnbalancedCompare = 'Operaci�n/Comparaci�n desigual (%1s %2s %3s)';
  CS_loPartialKey = 'olClaveParcial';
  CS_maAutomatic = 'baAutomatico';
  CS_maBottomToTop = 'amAbajoAArriba';
  CS_MainForm = 'PantallaPrincipal';
  CS_maLeftToRight = 'amIzquierdaADerecha';
  CS_maManual = 'baManual';
  CS_maNone = 'amNinguna';
  CS_maParent = 'baPadre';
  CS_Margin = 'Margen';
  CS_maRightToLeft = 'amDerechaAIzquierda';
  CS_maTopToBottom = 'amArribaAAbajo';
  CS_Max = 'Maximo';
  CS_MaxLength = 'LongitudMaxima';
  CS_MaxValue = 'ValorMaximo';
  CS_mbBarBreak = 'cmCorteVertical';
  CS_mbBreak = 'cmCorte';
  CS_mbLeft = 'brIzquierdo';
  CS_mbMiddle = 'brCentral';
  CS_mbNone = 'cmNinguno';
  CS_mbRight = 'brDerecho';
  CS_MDIChildCount = 'CantidadHijosMDI';
  CS_MDIChildren = 'HijosMDI';
  CS_Menu = 'Menu';
  CS_MenuAnimation = 'AnimacionDeMenu';
  CS_MenuIndex = 'IndiceMenu';
  CS_Min = 'Minimo';
  CS_MINUS = 'menos';
  CS_MinValue = 'ValorMinimo';
  CS_ModalResult = 'ResultadoMostrarYEsperar';
  CS_Mode = 'Modo';
  CS_Modified = 'Modificado';
  CS_MonoChrome = 'Monocromo';
  CS_MouseDeltaX = 'DistanciaHRaton';
  CS_MouseDeltaY = 'DistanciaVRaton';
  CS_mrAbort = 'meAbortar';
  CS_mrAll = 'meTodo';
  CS_mrCancel = 'meCancelar';
  CS_mrIgnore = 'meIgnorar';
  CS_mrNo = 'meNo';
  CS_mrNone = 'meNinguno';
  CS_mrNoToAll = 'meNoATodo';
  CS_mrOk = 'meAceptar';
  CS_mrRetry = 'meReintentar';
  CS_mrYes = 'meSi';
  CS_mrYesToAll = 'meSiATodo';
  CS_MSecPerDay = 'MilisegundosPorDia';
  CS_Multiselect = 'SeleccionMultiple';
  CS_Names = 'Nombres';
  CS_NaNa = 'NaNa';
  CS_NestedDataSet = 'ConjuntoDeDatosAnidado';
  CS_NewValue = 'ValorNuevo';
  CS_NumGlyphs = 'NumeroDeImagenes';
  CS_ObjectMenuItem = 'ElementoDeMenuDeObjeto';
  CS_Objects = 'Objetos';
  CS_ObjectType = 'TipoObjeto';
  CS_ObjectView = 'VistaDeObjetos';
  CS_OemConvert = 'ConvertirFOE';
  CS_Offset = 'Desplazamiento';
  CS_OldValue = 'ValorAnterior';
  CS_OleFormObject = 'PantallaOLE';
  CS_OnActivate = 'AlActivarse';
  CS_OnAdvancedDrawItem = 'AlDibujarAvanzado';
  CS_OnCalcFields = 'AlCalcularCampos';
  CS_OnChange = 'AlCambiar';
  CS_OnChanging = 'AlEstarCambiando';
  CS_OnClick = 'AlApretar';
  CS_OnClose = 'AlCerrarse';
  CS_OnCloseQuery = 'AlAceptarCierre';
  CS_OnCreate = 'AlCrearse';
  CS_OnDblClick = 'AlApretarDosVeces';
  CS_OnDeactivate = 'AlDesactivarse';
  CS_OnDeleteError = 'AlFallarBorrado';
  CS_OnDestroy = 'AlDestruirse';
  CS_OnDragDrop = 'AlArrastrarYSoltar';
  CS_OnDragOver = 'Al' + CS_DragOver;
  CS_OnDrawItem = 'AlDibujarElemento';
  CS_OnDropDown = 'AlDesplegar';
  CS_OnEditError = 'AlFallarEdicion';
  CS_OnEndDrag = 'AlFinalizarArrastre';
  CS_OnEnter = 'AlIngresar';
  CS_OnExit = 'AlSalir';
  CS_OnFilterRecord = 'AlFiltrarRegistro';
  CS_OnGetText = 'AlObtenerTexto';
  CS_OnHelp = 'AlMostrarAyuda';
  CS_OnHide = 'AlOcultarse';
  CS_OnHint = 'AlAconsejar';
  CS_OnIdle = 'AlEstarInactivo';
  CS_OnKeyDown = 'AlOprimirTecla';
  CS_OnKeyPress = 'AlTeclear';
  CS_OnKeyUp = 'AlSoltarTecla';
  CS_OnMeasureItem = 'AlMedirElemento';
  CS_OnMinimize = 'AlMinimizar';
  CS_OnMouseDown = 'AlOprimirRaton';
  CS_OnMouseMove = 'AlMoverRaton';
  CS_OnMouseUp = 'AlSoltarRaton';
  CS_OnNewRecord = 'AlCrearRegistro';
  CS_OnPageChanged = 'AlCambiarPagina';
  CS_OnPaint = 'AlDibujar';
  CS_OnPopUp = 'AlEmerger';
  CS_OnPostError = 'AlFallarConfirmacion';
  CS_OnResize = 'AlRedimensionar';
  CS_OnRestore = 'AlRestablecer';
  CS_OnScroll = 'AlDesplazar';
  CS_OnSetText = 'AlEstablecerTexto';
  CS_OnShow = 'AlMostrarse';
  CS_OnSized = 'AlFinalizarDimensionado';
  CS_OnSizing = 'AlDimensionar';
  CS_OnStartDrag = 'AlIniciarArrastre';
  CS_OnTimer = 'AlVencerTemporizador';
  CS_OnValidate = 'AlValidar';
  CS_Options = 'Opciones';
  CS_Origin = 'Origen';
  CS_Owner = 'Propietario';
  CS_OwnerDraw = 'DibujadoParticular';
  CS_paCenter = 'aeCentro';
  CS_PageIndex = 'IndiceDePagina';
  CS_Pages = 'Paginas';
  CS_paLeft = 'aeIzquierda';
  CS_Palette = 'Paleta';
  CS_ParamValues = 'ValoresParametros';
  CS_Parent = 'Padre';
  CS_ParentBiDiMode = 'UsarModoBiDiPadre';
  CS_ParentColor = 'UsarColorDelPadre';
  CS_ParentCtl3D = 'Usar3DDelPadre';
  CS_ParentDef = 'DefinicionesPadre';
  CS_ParentField = 'CampoPadre';
  CS_ParentFont = 'UsarFuenteDelPadre';
  CS_ParentShowHint = 'MostraAyudaComoElPadre';
  CS_paRight = 'aeDerecha';
  CS_PasswordChar = 'CaracterDeOcultacion';
  CS_Pen = 'Lapiz';
  CS_pfHidden = 'bpOculto';
  CS_pfInKey = 'bpEnClave';
  CS_pfInUpdate = 'bpEnActualizacion';
  CS_pfInWhere = 'bpEnCondicion';
  CS_Picture = 'Pintura';
  CS_Pitch = 'AnchoRelativo';
  CS_Pixels = 'Pixeles';
  CS_PixelsPerInch = 'PixelesPorPulgada';
  CS_pmBlack = 'mlNegro';
  CS_pmCopy = 'mlColor';
  CS_pmMask = 'mlComunColorConFondo';
  CS_pmMaskNotPen = 'mlComunColorInvertidoConFondo';
  CS_pmMaskPenNot = 'mlComunColorConFondoInvertido';
  CS_pmMerge = 'mlColorConFondo';
  CS_pmMergeNotPen = 'mlColorInvertidoConFondo';
  CS_pmMergePenNot = 'mlColorConFondoInvertido';
  CS_pmNop = 'mlSinCambio';
  CS_pmNot = 'mlInvertirFondo';
  CS_pmNotCopy = 'mlColorInverso';
  CS_pmNotMask = 'mlComunInversoColorConInversoFondo';
  CS_pmNotMerge = 'mlInversoColorConInversoFondo';
  CS_pmNotXOR = 'mlXORInvertido';
  CS_pmWhite = 'mlBlanco';
  CS_pmXOR = 'mlXOR';
  CS_poDefault = 'pPorOmision';
  CS_poDefaultPosOnly = 'pPosicionPorOmision';
  CS_poDefaultSizeOnly = 'pTama�oPorOmision';
  CS_poDesigned = 'pDise�ada';
  CS_poDesktopCenter = 'pCentroEscritorio';
  CS_poMainFormCenter = 'pCentroPantallaPrincipal';
  CS_poNone = 'eNinguna';
  CS_poOwnerFormCenter = 'pCentroPantallaPropietaria';
  CS_Pop = 'Desapila';
  CS_POP_GOTO = 'Desapila/Salta';
  CS_POP2_GOTO = 'Desapila2/Salta';
  CS_POPEXCEPTION = 'Desapilar Excepci�n';
  CS_poPrintToFit = 'eAjustarALaImpresion';
  CS_poProportional = 'eProporcional';
  CS_PopUpComponent = 'ComponenteEmergente';
  CS_PopUpMenu = 'MenuEmergente';
  CS_poScreenCenter = 'pCentroMonitor';
  CS_Position = 'Posicion';
  CS_Precision = 'Precision';
  CS_PrintScale = 'EscalaDeImpresion';
  CS_Proc = 'Procedimiento';
  CS_Procs = 'Procedimientos';
  CS_ProviderFlags = 'BanderasProveedor';
  CS_psClear = 'elLimpio';
  CS_psDash = 'elLinea';
  CS_psDashDot = 'elLineaPunto';
  CS_psDashDotDot = 'elLineaPuntoPunto';
  CS_psDot = 'elPunto';
  CS_psInsideFrame = 'elPorDentro';
  CS_psSolid = 'elSolido';
  CS_ptInput = 'tpEntrada';
  CS_ptInputOutput = 'tpEntradaYSalida';
  CS_ptOutput = 'tpSalida';
  CS_ptResult = 'tpResultado';
  CS_ptUnknown = 'tpDesconocido';
  CS_Push = 'Apila';
  CS_PUSHEXCEPTION = 'Apilar Excepci�n';
  CS_PUSHTYPE = 'Apilar Tipo';
  CS_PushVar = 'Apila variable';
  CS_RadioItem = 'ElementoDeSeleccion';
  CS_Range = 'Rango';
  CS_ReadOnly = 'SoloLectura';
  CS_RecordCount = 'CantidadRegistros';
  CS_RecordSize = 'Tama�oRegistro';
  CS_RecNo = 'NumeroRegistro';
  CS_REferenceTableName = 'NombreTablaReferencia';
  CS_Required = 'Requerido';
  CS_RET = 'Retorno';
  CS_SaveToFile = 'GuardarEnArchivo';
  CS_SaveToStream = 'GuardarEnFlujo';
  CS_sbHorizontal = 'tbdHorizontal';
  CS_sbVertical = 'tbdVertical';
  CS_Scaled = 'AEscala';
  CS_scBottom = 'cbdAlFinal';
  CS_scEndScroll = 'cbdFinalizarDesplazamiento';
  CS_scLineDown = 'cbdAbajoDeALineas';
  CS_scLineUp = 'cbdArribaDeALineas';
  CS_scPageDown = 'cbdAbajoDeAPaginas';
  CS_scPageUp = 'cbdArribaDeAPaginas';
  CS_scPosition = 'cbdPosicion';
  CS_script = 'Algoritmo';
  CS_ScrollPos = 'PosicionDesplazamiento';
  CS_ScrollBars = 'BarrasDeDesplazamiento';
  CS_scTop = 'cbdAlComienzo';
  CS_scTrack = 'cbdSeguir';
  CS_SecsPerDay = 'SegundosPorDia';
  CS_SectionWidth = 'AnchoSeccion';
  CS_Sections = 'Secciones';
  CS_SelCount = 'CantidadSeleccionados';
  CS_Selected = 'Seleccionado';
  CS_Self = 'Yo';
  CS_SelLength = 'LongitudSeleccion';
  CS_SelStart = 'ComienzoSeleccion';
  CS_SelText = 'TextoSeleccionado';
  CS_SETCOPYPOINTER = 'Estblecer Copia de Puntero';
  CS_SETFLAG = 'Establecer Bandera';
  CS_SETPOINTER = 'Establecer Puntero';
  CS_SETSTACKTYPE = 'Establecer Tipo de pila';
  CS_Shape = 'Figura';
  CS_ShortCut = 'Atajo';
  CS_ShowAccelChar = 'MostrarCaracterDeAcceso';
  CS_ShowHint = 'MostrarConsejos';
  CS_Showing = 'Mostrando';
  CS_ShowMainForm = 'MostrarPantallaPrincipal';
  CS_size = 'Tama�o';
  CS_SmallChange = 'CambioPeque�o';
  CS_soFromBeginning = 'pdComienzo';
  CS_soFromCurrent = 'pdActual';
  CS_soFromEnd = 'pdFinal';
  CS_Source = 'Fuente';
  CS_SourceLine = 'LineaAlgoritmo';
  CS_Spacing = 'Espaciado';
  CS_SparseArrays = 'ArreglosDispersos';
  CS_ssAlt = 'emAlt';
  CS_ssBoth = 'ebdAmbas';
  CS_ssCtrl = 'emControl';
  CS_ssDouble = 'emDoble';
  CS_ssHorizontal = 'ebdHorizontal';
  CS_ssLeft = 'emIzquierdo';
  CS_ssMiddle = 'emMedio';
  CS_ssNone = 'ebdNinguna';
  CS_ssRight = 'emDerecho';
  CS_ssShift = 'emMayusculas';
  CS_ssVertical = 'ebdVertical';
  CS_State = 'Estado';
  CS_stCircle = 'tfCirculo';
  CS_stEllipse = 'tfElipse';
  CS_stRectangle = 'tfRectangulo';
  CS_Strings = 'Cadenas';
  CS_stRoundRect = 'tfRectanguloRedondeado';
  CS_stRoundSquare = 'tfCuadradoRedondeado';
  CS_stSquare = 'tfCuadrado';
  CS_Stretch = 'Estirar';
  CS_Style = 'Estilo';
  CS_StyleChanged = 'CambioDeEstilo';
  CS_SubmenuImages = 'ImagenesSubMenu';
  CS_svar = 'variable';
  CS_System = 'Sistema';
  CS_TabOrder = 'OrdenNavegacion';
  CS_TabStop = 'Navegable';
  CS_TabWidth = 'AnchoDeTabulacion';
  CS_taCenter = 'taCentrado';
  CS_Tag = 'Marcador';
  CS_taLeftJustify = 'taALaIzquierda';
  CS_taRightJustify = 'taALaDerecha';
  CS_tbLeftButton = 'bsBotonIzquierdo';
  CS_tbRightButton = 'bsBotonDerecho';
  CS_Terminated = 'Terminado';
  CS_Text = 'Texto';
  CS_TileMode = 'ModoEnMosaico';
  CS_Title = 'Titulo';
  CS_tlBottom = 'dtAbajo';
  CS_tlCenter = 'dtAlCentro';
  CS_tlTop = 'dtArriba';
  CS_toEOF = 'toFinDeArchivo';
  CS_toFloat = 'toReal';
  CS_toInteger = 'toEntero';
  CS_Token = 'Porcion';
  CS_Top = 'Arriba';
  CS_TopIndex = 'IndiceDelSuperior';
  CS_toString = 'toCadena';
  CS_toSymbol = 'toSimbolo';
  CS_TrackButton = 'BotonDeSeguimiento';
  CS_Tracking = 'Seguimiento';
  CS_Transliterate = 'Traducir';
  CS_Transparent = 'Transparente';
  CS_TransparentColor = 'ColorTransparente';
  CS_Type = 'tipo';
  CS_Types = 'tipos';
  CS_Unnamed = 'SinNombre';
  CS_Updated = 'Actualizado';
  CS_UpdateFormatSettings = 'ActualizarConfiguracionDeFormato';
  CS_usDeleted = 'eaBorrado';
  CS_usInserted = 'eaInsertado';
  CS_usModified = 'eaModificado';
  CS_usUnmodified = 'eaNoModificado';
  CS_ValidChars = 'CaracteresValidos';
  CS_Values = 'Valores';
  CS_vars = 'variables';
  CS_VertScrollBar = 'BarraDesplazamientoVertical';
  CS_Visible = 'Visible';
  CS_WantReturns = 'CapturarRetornos';
  CS_WantTabs = 'CapturarTabulaciones';
  CS_Width = 'Ancho';
  CS_Window = 'Pantalla';
  CS_WindowHandle = 'IdentificadorPantalla';
  CS_WindowMenu = 'MenuDePantalla';
  CS_WindowState = 'EstadoPantalla';
  CS_WordWrap = 'CortarLineas';
  CS_wsMaximized = 'epMaximizada';
  CS_wsMinimized = 'epMinimizada';
  CS_wsNormal = 'epNormal';
  SYNS_FilterSeudocodigo = 'Seudoc�digo (*.sdc)|*.sdc';
  SYNS_LangSeudocodigo = 'Seudoc�digo';

const
{ sintaxis }
  CS_varBlock = '(CSTI_Identifier,' + CS_type + '|CSTII_array,'+CS_type+'|CSTII_record,'+CS_type+'|);CSTI_Identifier,' + CS_var + ';[{CSTI_Comma,;CSTI_Identifier,' + CS_var + ';};];';
  CS_procparamBlock = 'CSTI_Identifier,' + CS_type + ';[CSTII_var,;];CSTI_Identifier,' + CS_var + ';[{CSTI_Comma,;[CSTII_var,;];CSTI_Identifier,' + CS_var + ';};];';
  CS_funcparamBlock = 'CSTI_Identifier,' + CS_type + ';CSTI_Identifier,' + CS_var + ';[{CSTI_Comma,;CSTI_Identifier,' + CS_var + ';};];';
  CS_paramsBlock = '[CSTI_OpenRound,;paramBlock,paramBlock;[{CSTI_SemiColon,;paramBlock,paramBlock;};];CSTI_CloseRound,;]';
  CS_funcType = 'CSTI_Identifier,' + CS_type + ';CSTI_Identifier,' + CS_result + ';';
  CS_procBlock = '((CSTII_procedure,|CSTII_constructor,|CSTII_destructor,|);CSTI_Identifier,' + CS_name + ';paramsBlock,paramsBlock;|CSTII_function,;CSTI_Identifier,' + CS_name + ';paramsBlock,paramsBlock;funcType,funcType;|)';
  CS_pascalprocBlock = CS_procBlock;
  CS_pascalfuncType = 'CSTI_colon,;CSTI_Identifier,' + CS_type + ';';
  CS_pascalparamsBlock = CS_paramsBlock;
  CS_pascalparamBlock ='[(CSTII_var,|CSTII_const,|CSTII_out,|);];CSTI_Identifier,' + CS_var + ';[{CSTI_Comma,;[(CSTII_var,|CSTII_const,|CSTII_out,|);];CSTI_Identifier,' + CS_var + ';};];CSTI_Colon,;CSTI_Identifier,' + CS_type + ';';

type
  TsinPieceType = (sptRequired,sptOptional,sptRepeat,sptOption);
  TopPrecedence = set of TPSPasToken;

const
  Precedence: array[0..6] of TopPrecedence = (
    [CSTII_or],
    [CSTII_and,CSTII_xor],
    [CSTII_not],
    [CSTI_GreaterEqual, CSTI_LessEqual, CSTI_Greater, CSTI_Less, CSTI_Equal, CSTI_NotEqual, CSTII_in, CSTII_is],
    [CSTI_Plus, CSTI_Minus],
    [CSTI_multiply,CSTII_div,CSTI_divide,CSTII_mod],
    [CSTII_pow,CSTII_Shl, CSTII_Shr,CSTII_As]
  );

function sinPieceType(const piece:string):TsinPieceType;
function nextSinPiece(var block:string;InnerSplit:boolean=False):string;
function pieceToError(const tipo:integer): TPSPascalCompilerErrorType;

function RTClassName(ClassName:string):string;
function GetDelphiPropertyName(RTName:string):string;

implementation
uses sysutils;

function pieceToError(const tipo:integer): TPSPascalCompilerErrorType;
begin
  result := ecSyntaxError;
  case TPSPasToken(tipo) of
    CSTI_EOF: result := ecUnexpectedEndOfFile;
    CSTI_Identifier: result := ecIdentifierExpected;
    CSTI_SemiColon: result := ecSemicolonExpected;
    CSTI_Comma: result := ecCommaExpected;
    CSTI_Period: result := ecPeriodExpected;
    CSTI_Colon: result := ecColonExpected;
    CSTI_OpenRound: result := ecOpenRoundExpected;
    CSTI_CloseRound: result := ecCloseRoundExpected;
    CSTI_OpenBlock: result := ecOpenBlockExpected;
    CSTI_CloseBlock: result := ecCloseBlockExpected;
    CSTI_Assignment: result := ecAssignmentExpected;
    CSTI_String: result := ecStringExpected;
    CSTII_begin: result := ecBeginExpected;
    CSTII_do: result := ecDoExpected;
    CSTII_end: result := ecEndExpected;
    CSTII_of: result := ecOfExpected;
    CSTII_then: result := ecThenExpected;
    CSTII_to: result := ecToExpected;
    CSTII_Is: result := ecIsExpected;
  end;
end;

function sinPieceType(const piece:string):TsinPieceType;
begin
  if Pos('[',piece) = 1 then
    result := sptOptional
  else if Pos('{',piece) = 1 then
    result := sptRepeat
  else if Pos('(',piece) = 1 then
    result := sptOption
  else
    result := sptRequired;
end;

function nextSinPiece(var block:string;InnerSplit:boolean = False):string;
  function StrToCTTI(s:string):string;
  begin
    if s = 'CSTI_EOF' then result := IntToStr(integer(CSTI_EOF))
    else if s = 'CSTIINT_Comment' then result := IntToStr(integer((CSTIINT_Comment)))
    else if s = 'CSTIINT_WhiteSpace' then result := IntToStr(integer((CSTIINT_WhiteSpace)))
    else if s = 'CSTI_Identifier' then result := IntToStr(integer((CSTI_Identifier)))
    else if s = 'CSTI_SemiColon' then result := IntToStr(integer((CSTI_SemiColon)))
    else if s = 'CSTI_Comma' then result := IntToStr(integer((CSTI_Comma)))
    else if s = 'CSTI_Period' then result := IntToStr(integer((CSTI_Period)))
    else if s = 'CSTI_Colon' then result := IntToStr(integer((CSTI_Colon)))
    else if s = 'CSTI_OpenRound' then result := IntToStr(integer((CSTI_OpenRound)))
    else if s = 'CSTI_CloseRound' then result := IntToStr(integer((CSTI_CloseRound)))
    else if s = 'CSTI_OpenBlock' then result := IntToStr(integer((CSTI_OpenBlock)))
    else if s = 'CSTI_CloseBlock' then result := IntToStr(integer((CSTI_CloseBlock)))
    else if s = 'CSTI_Assignment' then result := IntToStr(integer((CSTI_Assignment)))
    else if s = 'CSTI_Equal' then result := IntToStr(integer((CSTI_Equal)))
    else if s = 'CSTI_NotEqual' then result := IntToStr(integer((CSTI_NotEqual)))
    else if s = 'CSTI_Greater' then result := IntToStr(integer((CSTI_Greater)))
    else if s = 'CSTI_GreaterEqual' then result := IntToStr(integer((CSTI_GreaterEqual)))
    else if s = 'CSTI_Less' then result := IntToStr(integer((CSTI_Less)))
    else if s = 'CSTI_LessEqual' then result := IntToStr(integer((CSTI_LessEqual)))
    else if s = 'CSTI_Plus' then result := IntToStr(integer((CSTI_Plus)))
    else if s = 'CSTI_Minus' then result := IntToStr(integer((CSTI_Minus)))
    else if s = 'CSTI_Divide' then result := IntToStr(integer((CSTI_Divide)))
    else if s = 'CSTI_Multiply' then result := IntToStr(integer((CSTI_Multiply)))
    else if s = 'CSTI_Integer' then result := IntToStr(integer((CSTI_Integer)))
    else if s = 'CSTI_Real' then result := IntToStr(integer((CSTI_Real)))
    else if s = 'CSTI_String' then result := IntToStr(integer((CSTI_String)))
    else if s = 'CSTI_Char' then result := IntToStr(integer((CSTI_Char)))
    else if s = 'CSTI_HexInt' then result := IntToStr(integer((CSTI_HexInt)))
    else if s = 'CSTI_AddressOf' then result := IntToStr(integer((CSTI_AddressOf)))
    else if s = 'CSTI_Dereference' then result := IntToStr(integer((CSTI_Dereference)))
    else if s = 'CSTI_TwoDots' then result := IntToStr(integer((CSTI_TwoDots)))
    else if s = 'CSTII_and' then result := IntToStr(integer((CSTII_and)))
    else if s = 'CSTII_array' then result := IntToStr(integer((CSTII_array)))
    else if s = 'CSTII_begin' then result := IntToStr(integer((CSTII_begin)))
    else if s = 'CSTII_case' then result := IntToStr(integer((CSTII_case)))
    else if s = 'CSTII_const' then result := IntToStr(integer((CSTII_const)))
    else if s = 'CSTII_div' then result := IntToStr(integer((CSTII_div)))
    else if s = 'CSTII_do' then result := IntToStr(integer((CSTII_do)))
    else if s = 'CSTII_downto' then result := IntToStr(integer((CSTII_downto)))
    else if s = 'CSTII_else' then result := IntToStr(integer((CSTII_else)))
    else if s = 'CSTII_end' then result := IntToStr(integer((CSTII_end)))
    else if s = 'CSTII_for' then result := IntToStr(integer((CSTII_for)))
    else if s = 'CSTII_function' then result := IntToStr(integer((CSTII_function)))
    else if s = 'CSTII_if' then result := IntToStr(integer((CSTII_if)))
    else if s = 'CSTII_in' then result := IntToStr(integer((CSTII_in)))
    else if s = 'CSTII_mod' then result := IntToStr(integer((CSTII_mod)))
    else if s = 'CSTII_not' then result := IntToStr(integer((CSTII_not)))
    else if s = 'CSTII_of' then result := IntToStr(integer((CSTII_of)))
    else if s = 'CSTII_or' then result := IntToStr(integer((CSTII_or)))
    else if s = 'CSTII_procedure' then result := IntToStr(integer((CSTII_procedure)))
    else if s = 'CSTII_program' then result := IntToStr(integer((CSTII_program)))
    else if s = 'CSTII_repeat' then result := IntToStr(integer((CSTII_repeat)))
    else if s = 'CSTII_record' then result := IntToStr(integer((CSTII_record)))
    else if s = 'CSTII_set' then result := IntToStr(integer((CSTII_set)))
    else if s = 'CSTII_shl' then result := IntToStr(integer((CSTII_shl)))
    else if s = 'CSTII_shr' then result := IntToStr(integer((CSTII_shr)))
    else if s = 'CSTII_then' then result := IntToStr(integer((CSTII_then)))
    else if s = 'CSTII_to' then result := IntToStr(integer((CSTII_to)))
    else if s = 'CSTII_type' then result := IntToStr(integer((CSTII_type)))
    else if s = 'CSTII_until' then result := IntToStr(integer((CSTII_until)))
    else if s = 'CSTII_uses' then result := IntToStr(integer((CSTII_uses)))
    else if s = 'CSTII_var' then result := IntToStr(integer((CSTII_var)))
    else if s = 'CSTII_while' then result := IntToStr(integer((CSTII_while)))
    else if s = 'CSTII_with' then result := IntToStr(integer((CSTII_with)))
    else if s = 'CSTII_xor' then result := IntToStr(integer((CSTII_xor)))
    else if s = 'CSTII_exit' then result := IntToStr(integer((CSTII_exit)))
    else if s = 'CSTII_class' then result := IntToStr(integer((CSTII_class)))
    else if s = 'CSTII_constructor' then result := IntToStr(integer((CSTII_constructor)))
    else if s = 'CSTII_destructor' then result := IntToStr(integer((CSTII_destructor)))
    else if s = 'CSTII_inherited' then result := IntToStr(integer((CSTII_inherited)))
    else if s = 'CSTII_private' then result := IntToStr(integer((CSTII_private)))
    else if s = 'CSTII_public' then result := IntToStr(integer((CSTII_public)))
    else if s = 'CSTII_published' then result := IntToStr(integer((CSTII_published)))
    else if s = 'CSTII_protected' then result := IntToStr(integer((CSTII_protected)))
    else if s = 'CSTII_property' then result := IntToStr(integer((CSTII_property)))
    else if s = 'CSTII_virtual' then result := IntToStr(integer((CSTII_virtual)))
    else if s = 'CSTII_override' then result := IntToStr(integer((CSTII_override)))
    //else if s = 'CSTII_default' then result := IntToStr(integer((CSTII_default) //Birb))
    else if s = 'CSTII_As' then result := IntToStr(integer((CSTII_As)))
    else if s = 'CSTII_Is' then result := IntToStr(integer((CSTII_Is)))
    else if s = 'CSTII_Unit' then result := IntToStr(integer((CSTII_Unit)))
    else if s = 'CSTII_Try' then result := IntToStr(integer((CSTII_Try)))
    else if s = 'CSTII_Except' then result := IntToStr(integer((CSTII_Except)))
    else if s = 'CSTII_Finally' then result := IntToStr(integer((CSTII_Finally)))
    else if s = 'CSTII_External' then result := IntToStr(integer((CSTII_External)))
    else if s = 'CSTII_Forward' then result := IntToStr(integer((CSTII_Forward)))
    else if s = 'CSTII_Export' then result := IntToStr(integer((CSTII_Export)))
    else if s = 'CSTII_Label' then result := IntToStr(integer((CSTII_Label)))
    else if s = 'CSTII_Goto' then result := IntToStr(integer((CSTII_Goto)))
    else if s = 'CSTII_Chr' then result := IntToStr(integer((CSTII_Chr)))
    else if s = 'CSTII_Ord' then result := IntToStr(integer((CSTII_Ord)))
    else if s = 'CSTII_Interface' then result := IntToStr(integer((CSTII_Interface)))
    else if s = 'CSTII_Implementation' then result := IntToStr(integer((CSTII_Implementation)))
    else if s = 'CSTII_initialization' then result := IntToStr(integer((CSTII_initialization)))            //* Nvds))
    else if s = 'CSTII_finalization' then result := IntToStr(integer((CSTII_finalization)))              //* Nvds))
    else if s = 'CSTII_out' then result := IntToStr(integer((CSTII_out)))
    else if s = 'CSTII_nil' then result := IntToStr(integer((CSTII_nil)))
    else
      result := s;
  end;
  function getPieceEnd:integer;
  var
    tend,stp:integer;
    starting,ending:char;
    stcnt:integer;
    sbl:string;
  begin
    sbl := block;
    starting := sbl[1];
    case starting of
      '[':ending := ']';
      '(':ending := ')';
      '{':ending := '}';
    end;
    Delete(sbl,1,1);
    result := 1;
    stcnt := 1;
    repeat
      tend := Pos(ending,sbl);
      result := result + tend;
      repeat
        stp := Pos(starting,sbl);
        if (stp > 0) and (stp < tend) then begin
          Inc(stcnt);
          Delete(sbl,1,stp);
          Dec(tend,stp);
        end else
          stp := 0;
      until stp = 0;
      Dec(stcnt);
      Delete(sbl,1,tend);
    until (stcnt = 0);
  end;
var
  spos:integer;
  epos:integer;
begin
  result := '';
  if block = '' then
    exit;
  epos := 0;
  if (block[1] = '[') or(block[1] = '(') or (block[1] = '{') then
    epos := getPieceEnd;
  if epos = Length(block) then begin //se trata de una 'subexpresion', quitar los extremos y procesar el resultado
    Delete(block,1,1);
    Delete(block,Length(block),1);
    result := nextSinPiece(block);
    exit;
  end;
  spos := Pos(';',block);
  if spos = 0 then begin //se trata de una porci�n simple o de una opci�n
    spos := Pos('|',block);
    if spos > 0 then begin //se trata de una opci�n
      result := Copy(block,1,spos-1);
    end else begin // porci�n simple
      spos := Pos(',',block);
      result := StrToCTTI(Copy(block,1,spos-1));
    end;
    Delete(block,1,spos);
  end else if (epos > 0) and (spos < epos) then begin
    result := Copy(block,1,epos);
    Delete(block,1,epos + 1);
  end else begin
    result := Copy(block,1,spos - 1);
    Delete(block,1,spos);
  end;
(*  result := '';
  subb := '';
  spos := Pos('[',block);
  if spos = 1 then begin
    epos := Pos(']',block);
    if epos = Length(block) then begin
      block := Copy(block,2,Length(block) - 1); // dejo el cierre para evitar saltear un nivel
      result := nextSinPiece(block);
      Delete(block,Length(block),1);//borro el cierre que hab�a dejado
      exit;
    end else begin
      subb := Copy(block,1,epos);
      delete(block,1,epos);
    end;
  end;
  spos := Pos('{',block);
  if spos = 1 then begin
    epos := Pos('}',block);
    if epos = Length(block) then begin
      block := Copy(block,2,Length(block) - 1); // dejo el cierre
      result := nextSinPiece(block);
      Delete(block,Length(block),1);//borro el cierre que hab�a dejado
      exit;
    end else begin
      subb := Copy(block,1,epos);
      delete(block,1,epos);
    end;
  end;
  spos := Pos(';',block);
  if spos = 0 then begin
    spos := Pos('|',block);
    if(spos > 0) then begin
      result := StrToCTTI(subb + Copy(block,1,spos - 1));
      Delete(block,1,spos);
      exit;
    end;
    if InnerSplit then begin
      spos := Pos(',',block);
      if spos > 0 then begin
        result := StrToCTTI(subb + Copy(block,1,spos - 1));
        Delete(block,1,spos);
        exit;
      end;
    end else if subb = '' then
      subb := block;
    spos := Length(block);
    result := subb;
  end else
    result := StrToCTTI(subb + Copy(block,1,spos - 1));
  Delete(block,1,spos);*)
end;

type
  TRTtoD = record
    DName,
    RTName:string;
  end;

{ �Se deben mantener ordenados, se hace b�squeda binaria !}
const
  RTClasses_Count = 136;
  RTClasses:array[0..RTClasses_Count - 1]of TRTtoD = (
    (DName: 'EMENUERROR';RTName:CS_EMenuError),
    (DName: 'EXCEPTION';RTName:CS_Exception),
    (DName: 'IDISPATCH';RTName:CS_IDispatch),
    (DName: 'IINTERFACE';RTName:CS_IInterface),
    (DName: 'IUNKNOWN';RTNAme: CS_IUnknown),
    (DName: 'TATIONLINK';RTName: CS_TActionLink),
    (DName: 'TADTFIELD';RTName: CS_TADTField),
    (DName: 'TAPPLICATION'; RTName: CS_TApplication),
  (DName: 'TARRAYFIELd'; RTName: CS_TArrayField),
  (DName: 'TAUTOINCFIELd'; RTName: CS_TAutoIncField),
  (DName: 'TBASICACTION'; RTName: CS_TBasicAction),
  (DName: 'TBCDFIELD'; RTName: CS_TBCDField),
  (DName: 'TBEVEL'; RTName: CS_TBevel),
  (DName: 'TBINARYFIELD'; RTName: CS_TBinaryField),
  (DName: 'TBITBTN'; RTName: CS_TBitBtn),
  (DName: 'TBITMAP'; RTName: CS_TBitmap),
  (DName: 'TBITS'; RTName: CS_TBits),
  (DName: 'TBLOBFIELD'; RTName: CS_TBlobField),
  (DName: 'TBOOLEANFIELD'; RTName: CS_TBooleanField),
  (DName: 'TBRUSH'; RTName: CS_TBrush),
  (DName: 'TBUTTON'; RTName: CS_TButton),
  (DName: 'TBUTTONCONTROL'; RTName: CS_TButtonControl),
  (DName: 'TBYTESFIELD'; RTName: CS_TBytesField),
  (DName: 'TCANVAS'; RTName: CS_TCanvas),
  (DName: 'TCHECKBOX'; RTName: CS_TCheckbox),
  (DName: 'TCMENUITEM'; RTName: CS_TCMenuItem),
  (DName: 'TCOLLECTION'; RTName: CS_TCollection),
  (DName: 'TCOLLECTIONITEM'; RTName: CS_TCollectionItem),
  (DName: 'TCOLLECTIONITEMCLASS'; RTName: CS_TCollectionItemClass),
  (DName: 'TCOMBOBOX'; RTName: CS_TComboBox),
  (DName: 'TCOMPONENT'; RTName: CS_TComponent),
  (DName: 'TCONTROL'; RTName: CS_TControl),
  (DName: 'TCONTROLSCROLLBAR'; RTName: CS_TControlScrollbar),
  (DName: 'TCURRENCYFIELD'; RTName: CS_TCurrencyField),
  (DName: 'TCUSTOMCHECKBOX'; RTName: CS_TCustomCheckBox),
  (DName: 'TCUSTOMCOMBOBOX'; RTName: CS_TCustomComboBox),
  (DName: 'TCUSTOMCONTROL'; RTName: CS_TCustomControl),
  (DName: 'TCUSTOMEDIT'; RTName: CS_TCustomEdit),
  (DName: 'TCUSTOMGROUPBOX'; RTName: CS_TCustomGroupBox),
  (DName: 'TCUSTOMIMAGELIST'; RTName: CS_TCustomImageList),
  (DName: 'TCUSTOMLABEL'; RTName: CS_TCustomLabel),
  (DName: 'TCUSTOMLISTBOX'; RTName: CS_TCustomListBox),
  (DName: 'TCUSTOMMEMO'; RTName: CS_TCustomMemo),
  (DName: 'TCUSTOMMEMORYSTREAM'; RTName: CS_TCustomMemoryStream),
  (DName: 'TCUSTOMPANEL'; RTName: CS_TCustomPanel),
  (DName: 'TCUSTOMRADIOGROUP'; RTName: CS_TCustomRadioGroup),
  (DName: 'TDATALINK'; RTName: CS_TDataLink),
  (DName: 'TDATASET'; RTName: CS_TDataSet),
  (DName: 'TDATASETDESIGNER'; RTName: CS_TDataSetDesigner),
  (DName: 'TDATASETFIELD'; RTName: CS_TDAtaSetField),
  (DName: 'TDATASOURCE'; RTName: CS_TDataSource),
  (DName: 'TDATEFIELD'; RTName: CS_TDateField),
  (DName: 'TDATETIMEFIELD'; RTName: CS_TDateTimeField),
  (DName: 'TDEFCOLLECTION'; RTName: CS_TDefCollection),
  (DName: 'TDRAGOBJECT'; RTName: CS_TDragObject),
  (DName: 'TEDIT'; RTName: CS_TEdit),
  (DName: 'TFIELD'; RTName: CS_TField),
  (DName: 'TFIELDCLASS'; RTName: CS_TFieldClass),
  (DName: 'TFIELDDEFLIST'; RTName: CS_TFieldDefList),
  (DName: 'TFIELDDEF'; RTName: CS_TFieldDef),
  (DName: 'TFIELDDEFS'; RTName: CS_TFieldDefs),
  (DName: 'TFIELDLIST'; RTName: CS_TFieldList),
  (DName: 'TFIELDS'; RTName: CS_TFields),
  (DName: 'TFILESTREAM'; RTName: CS_TFileStream),
  (DName: 'TFLATLIST'; RTName: CS_TFlatList),
  (DName: 'TFLOATFIELD'; RTName: CS_TFloatField),
  (DName: 'TFONT'; RTName: CS_TFont),
  (DName: 'TFORM'; RTName: CS_TForm),
  (DName: 'TGRAPHIC'; RTName: CS_TGraphic),
  (DName: 'TGRAPHICCONTROL'; RTName: CS_TGraphicControl),
  (DName: 'TGRAPHICFIELD'; RTName: CS_TGraphicField),
  (DName: 'TGRAPHICSOBJECT'; RTName: CS_TGraphicsObject),
  (DName: 'TGROUPBOX'; RTName: CS_TGroupBox),
  (DName: 'TGUIDFIELD'; RTName: CS_TGUIDField),
  (DName: 'THANDLESTREAM'; RTName: CS_THandleStream),
  (DName: 'THEADER'; RTName: CS_THeader),
  (DName: 'TICON'; RTName: CS_TIcon),
  (DName: 'TIFEXCEPTION'; RTName: CS_TIFException),
  (DName: 'TIMAGE'; RTName: CS_TImage),
  (DName: 'TIMAGELIST'; RTName: CS_TImageList),
  (DName: 'TINDEXDEf'; RTName: CS_TindexDef),
  (DName: 'TINDEXDEfS'; RTName: CS_TIndexDefs),
  (DName: 'TINTEGERFIELD'; RTName: CS_TintegerField),
  (DName: 'TLABEL'; RTName: CS_TLabel),
  (DName: 'TLARGEINTFIELD'; RTName: CS_TLargeIntField),
  (DName: 'TLIST'; RTName: CS_TList),
  (DName: 'TLISTBOX'; RTName: CS_TListBox),
  (DName: 'TMAINMENU'; RTName: CS_TMainMenu),
  (DName: 'TMEMO'; RTName: CS_TMemo),
  (DName: 'TMEMOFIELD'; RTName: CS_TMemoField),
  (DName: 'TMEMORYSTREAM'; RTName: CS_TMemoryStream),
  (DName: 'TMENU'; RTName: CS_TMenu),
  (DName: 'TMENUACTIONLINK'; RTName: CS_TMenuActionLink),
  (DName: 'TMENUITEM'; RTName: CS_TMenuItem),
  (DName: 'TMENUITEMSTACK'; RTName: CS_TMenuItemStack),
  (DName: 'TNAMEDITEM'; RTName: CS_TNamedItem),
  (DName: 'TNOTEBOOK'; RTName: CS_TNotebook),
  (DName: 'TNUMERICFIELD'; RTName: CS_TNumericField),
  (DName: 'TOBJECT'; RTName: CS_Tobject),
  (DName: 'TOBJECTFIELD'; RTName: CS_TObjectField),
  (DName: 'TOLEFORMOBJECT'; RTName: CS_TOleFormObject),
  (DName: 'TOWNEDCOLLECTION'; RTName: CS_TOwnedCollection),
  (DName: 'TPAGE'; RTName: CS_TPage),
  (DName: 'TPAINTBOX'; RTName: CS_TPaintBox),
  (DName: 'TPANEL'; RTName: CS_TPanel),
  (DName: 'TPARAM'; RTName: CS_TParam),
  (DName: 'TPARSER'; RTName: CS_TParser),
  (DName: 'TPEN'; RTName: CS_TPen),
  (DName: 'TPERSISTENT'; RTName: CS_TPersistent),
  (DName: 'TPICTURE'; RTName: CS_TPicture),
  (DName: 'TPOPUPLIST'; RTName: CS_TPopUpList),
  (DName: 'TPOPUPMENU'; RTName: CS_TPopUpMenu),
  (DName: 'TRADIOBUTTON'; RTName: CS_TRadioButton),
  (DName: 'TRADIOGROUP'; RTName: CS_TRadioGroup),
  (DName: 'TREFERENCEFIELD'; RTName: CS_TReferenceField),
  (DName: 'TRESOURCESTREAM'; RTName: CS_TResourceStream),
  (DName: 'TSCROLLBAR'; RTName: CS_TScrollBar),
  (DName: 'TSCROLLBOX'; RTName: CS_TScrollBox),
  (DName: 'TSCROLLINGWINCONTROL'; RTName: CS_TScrollingWinControl),
  (DName: 'TSHAPE'; RTName: CS_TShape),
  (DName: 'TSHORTCUT'; RTName: CS_TShortCut),
  (DName: 'TSMALLINTFIELD'; RTName: CS_TSmallIntField),
  (DName: 'TSPEEDBUTTON'; RTName: CS_TSpeedButton),
  (DName: 'TSTACK'; RTName: CS_TStack),
  (DName: 'TSTREAM'; RTName: CS_TStream),
  (DName: 'TSTRINGFIELD'; RTName: CS_TStringField),
  (DName: 'TSTRINGLIST'; RTName: CS_TStringList),
  (DName: 'TSTRINGS'; RTName: CS_TStrings),
  (DName: 'TTIMEFIELD'; RTName: CS_TTimeField),
  (DName: 'TTIMER'; RTName: CS_TTimer),
  (DName: 'TVARIANTFIELD'; RTName: CS_TVariantField),
  (DName: 'TVARBYTESFIELD'; RTName: CS_TVarBytesField),
  (DName: 'TVARCHARFIELD'; RTName: CS_TVarCharField),
  (DName: 'TWIDESTRINGFIELD'; RTName: CS_TWideStringField),
  (DName: 'TWINCONTROL'; RTName: CS_TWinControl),
  (DName: 'TWORDFIELD'; RTName: CS_TWordField) );

  RTProperties_Count = 137;
  RTProperties:array[0..RTProperties_Count - 1]of TRTtoD = (
  (DName: 'CANVAS'; RTName: CS_Canvas),
  (DName: 'CAPTION'; RTName: CS_Caption),
  (DName: 'CENTER'; RTName: CS_Center),
  (DName: 'CHARCASE'; RTName: CS_Charcase),
  (DName: 'CHECKED'; RTName: CS_Checked),
  (DName: 'CHILDDEFS'; RTName: CS_ChildDefs),
  (DName: 'CLIENTHEIGHT'; RTName: CS_ClientHeight),
  (DName: 'CLIENTWIDTH'; RTName: CS_ClientWidth),
  (DName: 'COLOR'; RTName: CS_Color),
  (DName: 'COLUMNS'; RTName: CS_Columns),
  (DName: 'COMMATEXT'; RTName: CS_CommaText),
  (DName: 'COMPONENTCOUNT'; RTName: CS_ComponentCount),
  (DName: 'COMPONENTS'; RTName: CS_Components),
  (DName: 'COMPONENTSTATE'; RTName: CS_ComponentState),
  (DName: 'CONTROLCOUNT'; RTName: CS_ControlCount),
  (DName: 'CONTROLS'; RTName: CS_Controls),
  (DName: 'COUNT'; RTName: CS_Count),
  (DName: 'CTL3D'; RTName: CS_Ctl3d),
  (DName: 'CURSOR'; RTName: CS_Cursor),
  (DName: 'DATASET'; RTName: CS_DataSet),
  (DName: 'DATASOURCE'; RTName: CS_DataSource),
  (DName: 'DISPLAYFORMAT'; RTName: CS_DisplayFormat),
  (DName: 'DISPLAYLABEL'; RTName: CS_DisplayLabel),
  (DName: 'DISPLAYNAME'; RTName: CS_DisplayName),
  (DName: 'DISPLAYWIDTH'; RTName: CS_DisplayWidth),
  (DName: 'DRAGCURSOR'; RTName: CS_DragCursor),
  (DName: 'DRAGMODE'; RTName: CS_DragMode),
  (DName: 'ENABLED'; RTName: CS_Enabled),
  (DName: 'EDITFORMAT'; RTName: CS_EditFormat),
  (DName: 'EDITMASK'; RTName: CS_EditMask),
  (DName: 'EXENAME'; RTName: CS_ExeName),
  (DName: 'FIELDCOUNT'; RTName: CS_FieldCount),
  (DName: 'FIELDDEFS'; RTName: CS_FieldDefs),
  (DName: 'FIELDS'; RTName: CS_Fields),
  (DName: 'FIElDVALUES'; RTName: CS_FieldValues),
  (DName: 'FILTER'; RTName: CS_Filter),
  (DName: 'FILTERED'; RTName: CS_Filtered),
  (DName: 'FONT'; RTName: CS_Font),
  (DName: 'FORMSTYLE'; RTName: CS_FormStyle),
  (DName: 'HEIGHT'; RTName: CS_Height),
  (DName: 'HELPFILE'; RTName: CS_HelpFile),
  (DName: 'HIDESELECTION'; RTName: CS_HideSelection),
  (DName: 'HINT'; RTName: CS_Hint),
  (DName: 'HORZSCROLLBAR'; RTName: CS_HorzScrollBar),
  (DName: 'ICON'; RTName: CS_Icon),
  (DName: 'IMAGEINDEX'; RTName: CS_ImageIndex),
  (DName: 'IMAGES'; RTName: CS_Images),
  (DName: 'ITEMS'; RTName: CS_Items),
  (DName: 'LEFT'; RTName: CS_Left),
  (DName: 'MAINFORM'; RTName: CS_MainForm),
  (DName: 'MDICHILDCOUNT'; RTName: CS_MDIChildCount),
  (DName: 'MDICHILDREN'; RTName: CS_MDIChildren),
  (DName: 'MENU'; RTName: CS_Menu),
  (DName: 'MULTISELECT'; RTName: CS_Multiselect),
  (DName: 'ONACTIVATE'; RTName: CS_OnActivate),
  (DName: 'ONADVANCEDDRAWITEM'; RTName: CS_OnAdvancedDrawItem),
  (DName: 'ONCAlCFIELDS'; RTName: CS_OnCalcFields),
  (DName: 'ONCHANGE'; RTName: CS_OnChange),
  (DName: 'ONCHANGING'; RTName: CS_OnChanging),
  (DName: 'ONCLICK'; RTName: CS_OnClick),
  (DName: 'ONCLOSE'; RTName: CS_OnClose),
  (DName: 'ONCLOSEQUERY'; RTName: CS_OnCloseQuery),
  (DName: 'ONCREATE'; RTName: CS_OnCreate),
  (DName: 'ONDBLCLICK'; RTName: CS_OnDblClick),
  (DName: 'ONDEACTIVATE'; RTName: CS_OnDeactivate),
  (DName: 'ONDELETEERROR'; RTName: CS_OnDeleteError),
  (DName: 'ONDESTROY'; RTName: CS_OnDestroy),
  (DName: 'ONDRAGDROP'; RTName: CS_OnDragDrop),
  (DName: 'ONDRAGOVER'; RTName: CS_OnDragOver),
  (DName: 'ONDRAWITEM'; RTName: CS_OnDrawItem),
  (DName: 'ONDROPDOWN'; RTName: CS_OnDropDown),
  (DName: 'ONEDITERROR'; RTName: CS_OnEditError),
  (DName: 'ONENDDRAG'; RTName: CS_OnEndDrag),
  (DName: 'ONENTER'; RTName: CS_OnEnter),
  (DName: 'ONEXIT'; RTName: CS_OnExit),
  (DName: 'ONFILTERRECORD'; RTName: CS_OnFilterRecord),
  (DName: 'ONGETTEXT'; RTName: CS_OnGetText),
  (DName: 'ONHELP'; RTName: CS_OnHelp),
  (DName: 'ONHIDE'; RTName: CS_OnHide),
  (DName: 'ONHINT'; RTName: CS_OnHint),
  (DName: 'ONIDLE'; RTName: CS_OnIdle),
  (DName: 'ONKEYDOWN'; RTName: CS_OnKeyDown),
  (DName: 'ONKEYPRESS'; RTName: CS_OnKeyPress),
  (DName: 'ONKEYUP'; RTName: CS_OnKeyUp),
  (DName: 'ONMEASUREITEM'; RTName: CS_OnMeasureItem),
  (DName: 'ONMINIMIZE'; RTName: CS_OnMinimize),
  (DName: 'ONMOUSEDOWN'; RTName: CS_OnMouseDown),
  (DName: 'ONMOUSEMOVE'; RTName: CS_OnMouseMove),
  (DName: 'ONMOUSEUP'; RTName: CS_OnMouseUp),
  (DName: 'ONNEWRECORD'; RTName: CS_OnNewRecord),
  (DName: 'ONPAGECHANGED'; RTName: CS_OnPageChanged),
  (DName: 'ONPAINT'; RTName: CS_OnPaint),
  (DName: 'ONPOPUP'; RTName: CS_OnPopUp),
  (DName: 'ONPOSTERROR'; RTName: CS_OnPostError),
  (DName: 'ONRESIZE'; RTName: CS_OnResize),
  (DName: 'ONRESTORE'; RTName: CS_OnRestore),
  (DName: 'ONSCROlL'; RTName: CS_OnScroll),
  (DName: 'ONSETTEXT'; RTName: CS_OnSetText),
  (DName: 'ONSHOW'; RTName: CS_OnShow),
  (DName: 'ONSIZED'; RTName: CS_OnSized),
  (DName: 'ONSIZING'; RTName: CS_OnSizing),
  (DName: 'ONSTARTDRAG'; RTName: CS_OnStartDrag),
  (DName: 'ONTIMER'; RTName: CS_OnTimer),
  (DName: 'ONVALIDATE'; RTName: CS_OnValidate),
  (DName: 'OPTIONS'; RTName: CS_Options),
  (DName: 'OWNERDRAW'; RTName: CS_OwnerDraw),
  (DName: 'PAGES'; RTName: CS_Pages),
  (DName: 'PARENT'; RTName: CS_Parent),
  (DName: 'PARENTBIDIMODE'; RTName: CS_ParentBiDiMode),
  (DName: 'PARENTCOLOR'; RTName: CS_ParentColor),
  (DName: 'PARENTCTL3D'; RTName: CS_ParentCtl3D),
  (DName: 'PARENTFONT'; RTName: CS_ParentFont),
  (DName: 'PARENTSHOWHINT'; RTName: CS_ParentShowHint),
  (DName: 'PEN'; RTName: CS_Pen),
  (DName: 'PICTURE'; RTName: CS_Picture),
  (DName: 'POPUPMENU'; RTName: CS_PopUpMenu),
  (DName: 'READONLY'; RTName: CS_ReadOnly),
  (DName: 'RECORDCOUNT'; RTName: CS_RecordCount),
  (DName: 'RECNO'; RTName: CS_RecNo),
  (DName: 'SCROLLPOS'; RTName: CS_ScrollPos),
  (DName: 'SCROLLBARS'; RTName: CS_ScrollBars),
  (DName: 'SELLENGTH'; RTName: CS_SelLength),
  (DName: 'SELSTART'; RTName: CS_SelStart),
  (DName: 'SHOWMAINFORM'; RTName: CS_ShowMainForm),
  (DName: 'STATE'; RTName: CS_State),
  (DName: 'STRINGS'; RTName: CS_Strings),
  (DName: 'TABORDER'; RTName: CS_TabOrder),
  (DName: 'TABSTOP'; RTName: CS_TabStop),
  (DName: 'TAG'; RTName: CS_Tag),
  (DName: 'TEXT'; RTName: CS_Text),
  (DName: 'TOP'; RTName: CS_Top),
  (DName: 'VALUES'; RTName: CS_Values),
  (DName: 'VISIBLE'; RTName: CS_Visible),
  (DName: 'WANTRETURNS'; RTName: CS_WantReturns),
  (DName: 'WANTTABS'; RTName: CS_WantTabs),
  (DName: 'WIDTH'; RTName: CS_Width),
  (DName: 'WORDWRAP'; RTName: CS_WordWrap) );


function FindName(SName:string;Names:array of TRTtoD;WantD:boolean = False):string;
var
  menor,mayor,medio:integer;
  s:string;
begin
  result := '';
  if WantD then begin
    for medio:=0 to High(Names) do begin
      if CompareText(SName,Names[medio].RTName) = 0 then begin
        result := Names[medio].DName;
        break;
      end;
    end;
    exit;
  end;
  menor := 0;
  mayor := High(Names);
  while(mayor - menor > 1)do begin
    medio := (mayor - menor) div 2;
    s := Names[menor + medio].DName;
    if SName = s then begin
      result := Names[menor+medio].RTName;
      exit;
    end else if SName > s then
      Inc(menor,medio)
    else
      Dec(mayor,medio);
  end;
  medio := menor;
  s := Names[medio].DName;
  if SName > s then begin
    medio := mayor;
    s := Names[medio].DName;
  end;
  if SName = s then
    result := Names[medio].RTName
end;

function RTClassName(ClassName:string):string;
begin
  result := FindName(ClassName,RTClasses);
  if result = '' then
    result := ClassName;
end;

function GetDelphiPropertyName(RTName:string):string;
begin
  result := FindName(RTName,RTProperties,True);
  if result = '' then
    result := RTName;
end;

end.


