import 'package:flutter/material.dart';
import 'package:investment_fund/core/enum/type_enume.dart';
import 'package:investment_fund/core/extension/context_extension.dart';

/// Panel de filtros para Pokémon por tipo.
/// Muestra todos los tipos disponibles con checkboxes y botones Aplicar/Cancelar.
class PanelFilter extends StatefulWidget {
  const PanelFilter({
    super.key,
    required this.selectedTypes,
    required this.onApply,
    required this.onCancel,
    required this.onClose,
  });

  final Set<String> selectedTypes;
  final void Function(Set<String> types) onApply;
  final VoidCallback onCancel;
  final VoidCallback onClose;

  @override
  State<PanelFilter> createState() => _PanelFilterState();
}

class _PanelFilterState extends State<PanelFilter> {
  late Set<String> _tempSelectedTypes;
  bool _isTypeSectionExpanded = true;

  @override
  void initState() {
    super.initState();
    _tempSelectedTypes = Set.from(widget.selectedTypes);
  }

  @override
  void didUpdateWidget(covariant PanelFilter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedTypes != widget.selectedTypes) {
      _tempSelectedTypes = Set.from(widget.selectedTypes);
    }
  }

  void _toggleType(String typeKey) {
    setState(() {
      if (_tempSelectedTypes.contains(typeKey)) {
        _tempSelectedTypes.remove(typeKey);
      } else {
        _tempSelectedTypes.add(typeKey);
      }
    });
  }

  void _handleApply() {
    widget.onApply(_tempSelectedTypes);
  }

  void _handleCancel() {
    setState(() => _tempSelectedTypes = Set.from(widget.selectedTypes));
    widget.onCancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: .symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    const SizedBox(height: 16),
                    _buildTypeSection(),
                  ],
                ),
              ),
            ),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: .fromLTRB(16, 16, 16, 8),
      child: Stack(
        alignment: .center,
        children: [
          Align(
            alignment: .centerLeft,
            child: IconButton(
              onPressed: widget.onClose,
              icon: Icon(Icons.close),
              style: IconButton.styleFrom(
                foregroundColor: Colors.black87,
              ),
            ),
          ),
          Text(
            context.l10n.filterByPreferences,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeSection() {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        InkWell(
          onTap: () {
            setState(() => _isTypeSectionExpanded = !_isTypeSectionExpanded);
          },
          child: Padding(
            padding: .symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.filterType,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Icon(
                  _isTypeSectionExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
        if (_isTypeSectionExpanded) ...[
          ...PokemonType.values.map((type) => _buildTypeOption(type)),
        ],
      ],
    );
  }

  Widget _buildTypeOption(PokemonType type) {
    final isSelected = _tempSelectedTypes.contains(type.key);
    return InkWell(
      onTap: () => _toggleType(type.key),
      child: Padding(
        padding: .symmetric(vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                type.displayName,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ),
            Checkbox(
              value: isSelected,
              onChanged: (_) => _toggleType(type.key),
              activeColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: .circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Padding(
      padding: .all(20),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _handleApply,
              style: FilledButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: .symmetric(vertical: 14),
              ),
              child: Text(context.l10n.apply),
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: _handleCancel,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black87,
                side: BorderSide(color: Colors.grey.shade300),
                padding: .symmetric(vertical: 14),
              ),
              child: Text(context.l10n.cancel),
            ),
          ),
        ],
      ),
    );
  }
}
